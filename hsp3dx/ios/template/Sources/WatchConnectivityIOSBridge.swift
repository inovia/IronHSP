//
//  WatchConnectivityIOSBridge.swift — iPhone 側 WC sender
//
//  Phase 4b: hsp3dx iOS app から paired Apple Watch (hsp3watch) に
//  メッセージを送信するためのブリッジ。 ObjC++ (main_ios.mm) から
//  @objc 経由で呼べるようにする。
//
//  検証用に startPeriodicTestSend() を提供。 起動 3 秒後から 5 秒間隔で
//  "ping #N at HH:mm:ss" を Watch に送る。
//

import Foundation
import WatchConnectivity

@objc public final class WatchConnectivityIOSBridge: NSObject {

    @objc public static let shared = WatchConnectivityIOSBridge()

    private var counter: Int = 0
    private var timer: Timer?

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

    /// テスト用: 3 秒待ってから 5 秒間隔で ping を Watch に送り続ける
    @objc public func startPeriodicTestSend() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            self?.timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
                self?.sendPing()
            }
            self?.sendPing()  // 即時に 1 発
        }
    }

    /// 任意のテキストを Watch に送る
    @objc public func send(text: String) {
        let s = WCSession.default
        guard s.activationState == .activated else {
            NSLog("[WC-iOS] not activated, skip send: \(text)")
            return
        }
        guard s.isReachable else {
            // reachable でない場合は applicationContext を使う (永続)
            do {
                try s.updateApplicationContext(["text": text])
                NSLog("[WC-iOS] sent via applicationContext: \(text)")
            } catch {
                NSLog("[WC-iOS] applicationContext error: \(error)")
            }
            return
        }
        s.sendMessage(["text": text], replyHandler: nil) { err in
            NSLog("[WC-iOS] sendMessage error: \(err)")
        }
        NSLog("[WC-iOS] sent: \(text)")
    }

    private func sendPing() {
        counter += 1
        let f = DateFormatter()
        f.dateFormat = "HH:mm:ss"
        send(text: "ping #\(counter) at \(f.string(from: Date()))")
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
}
