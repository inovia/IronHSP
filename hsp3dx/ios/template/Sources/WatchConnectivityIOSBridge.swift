//
//  WatchConnectivityIOSBridge.swift — iPhone 側 WC sender / receiver
//
//  Phase 9 強化:
//   - 5 種類のメッセージを順番に送る (時刻/挨拶/起動経過/seq#/random)
//   - Watch から受信した文字列を NSLog 出力
//

import Foundation
import WatchConnectivity

@objc public final class WatchConnectivityIOSBridge: NSObject {

    @objc public static let shared = WatchConnectivityIOSBridge()

    private var counter: Int = 0
    private var timer: Timer?
    private let bootTime = Date()

    private override init() {
        super.init()
        activate()
    }

    @objc public func activate() {
        guard WCSession.isSupported() else {
            NSLog("[WC-iOS] not supported")
            return
        }
        let s = WCSession.default
        s.delegate = self
        s.activate()
        NSLog("[WC-iOS] activate() called")
    }

    /// 起動 3 秒後から 5 秒間隔で test ping を Watch に送り続ける
    @objc public func startPeriodicTestSend() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            self?.timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
                self?.sendVariedMessage()
            }
            self?.sendVariedMessage()
        }
    }

    /// Phase 9: バリエーション付きで送信
    private func sendVariedMessage() {
        counter += 1
        let f = DateFormatter()
        f.dateFormat = "HH:mm:ss"
        let now = f.string(from: Date())
        let elapsed = Int(Date().timeIntervalSince(bootTime))
        let msg: String
        switch counter % 5 {
        case 1: msg = "Hello #\(counter)"
        case 2: msg = "now \(now)"
        case 3: msg = "up \(elapsed)s"
        case 4: msg = "seq=\(counter)"
        default: msg = "rand \(Int.random(in: 100...999))"
        }
        send(text: msg)
    }

    @objc public func send(text: String) {
        let s = WCSession.default
        guard s.activationState == .activated else {
            NSLog("[WC-iOS] not activated, skip: \(text)")
            return
        }
        if s.isReachable {
            s.sendMessage(["text": text], replyHandler: nil) { err in
                NSLog("[WC-iOS] sendMessage err: \(err)")
            }
            NSLog("[WC-iOS] sent (msg): \(text)")
        } else {
            do {
                try s.updateApplicationContext(["text": text])
                NSLog("[WC-iOS] sent (ctx): \(text)")
            } catch {
                NSLog("[WC-iOS] applicationContext err: \(error)")
            }
        }
    }

}

extension WatchConnectivityIOSBridge: WCSessionDelegate {

    public func session(_ session: WCSession,
                        activationDidCompleteWith activationState: WCSessionActivationState,
                        error: Error?) {
        NSLog("[WC-iOS] activated state=\(activationState.rawValue) reach=\(session.isReachable) paired=\(session.isPaired) err=\(error?.localizedDescription ?? "")")
    }

    public func sessionDidBecomeInactive(_ session: WCSession) {
        NSLog("[WC-iOS] became inactive")
    }

    public func sessionDidDeactivate(_ session: WCSession) {
        NSLog("[WC-iOS] deactivated")
        WCSession.default.activate()
    }

    public func sessionReachabilityDidChange(_ session: WCSession) {
        NSLog("[WC-iOS] reachability changed: \(session.isReachable)")
    }

    /// Phase 9b: Watch 側から sendMessage された時
    public func session(_ session: WCSession,
                        didReceiveMessage message: [String : Any]) {
        let s = (message["text"] as? String) ?? String(describing: message)
        NSLog("[WC-iOS] RECV from Watch: \(s)")
    }

    /// Watch 側から transferUserInfo / updateApplicationContext された時
    public func session(_ session: WCSession,
                        didReceiveApplicationContext applicationContext: [String : Any]) {
        let s = (applicationContext["text"] as? String) ?? String(describing: applicationContext)
        NSLog("[WC-iOS] RECV ctx from Watch: \(s)")
    }
}
