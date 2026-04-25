//
//  WatchConnectivityBridge.swift — iPhone と Watch のメッセージ送受
//
//  Phase 4a 受信のみ。 ContentView が ObservableObject として購読する。
//  シンプル化のため @MainActor は使わず、 delegate コールバックは
//  DispatchQueue.main で UI スレッドへ流し込む。
//

import Foundation
import Combine
import WatchConnectivity

final class WatchConnectivityBridge: NSObject, ObservableObject {

    static let shared = WatchConnectivityBridge()

    @Published var lastMessage: String = ""
    @Published var sessionState: String = "init"
    @Published var isReachable: Bool = false
    @Published var receiveCount: Int = 0
    @Published var debugLog: String = ""

    private override init() {
        super.init()
        appendLog("init called")
        activate()
    }

    func activate() {
        guard WCSession.isSupported() else {
            updateState("unsupported")
            appendLog("not supported")
            return
        }
        let s = WCSession.default
        s.delegate = self
        s.activate()
        updateState("activating")
        appendLog("activate() called")
    }

    func sendToPhone(_ message: [String: Any]) {
        let s = WCSession.default
        guard s.activationState == .activated else { return }
        s.sendMessage(message, replyHandler: nil) { err in
            print("[WC] sendToPhone error: \(err)")
        }
    }

    private func updateState(_ s: String) {
        DispatchQueue.main.async { [weak self] in
            self?.sessionState = s
        }
    }

    private func appendLog(_ s: String) {
        NSLog("[WC] \(s)")
        DispatchQueue.main.async { [weak self] in
            self?.debugLog = s
        }
    }
}

extension WatchConnectivityBridge: WCSessionDelegate {

    func session(_ session: WCSession,
                 activationDidCompleteWith activationState: WCSessionActivationState,
                 error: Error?) {
        let st: String
        switch activationState {
        case .activated:    st = "activated"
        case .inactive:     st = "inactive"
        case .notActivated: st = "notActivated"
        @unknown default:   st = "unknown"
        }
        let reach = session.isReachable
        let errStr = error?.localizedDescription ?? ""
        appendLog("activationDidComplete: \(st) reach=\(reach) err=\(errStr)")
        DispatchQueue.main.async { [weak self] in
            self?.sessionState = st
            self?.isReachable = reach
        }
    }

    func sessionReachabilityDidChange(_ session: WCSession) {
        let reach = session.isReachable
        appendLog("reachabilityChange: \(reach)")
        DispatchQueue.main.async { [weak self] in
            self?.isReachable = reach
        }
    }

    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        let s = (message["text"] as? String) ?? String(describing: message)
        appendLog("didReceiveMessage: \(s)")
        DispatchQueue.main.async { [weak self] in
            self?.lastMessage = s
            self?.receiveCount += 1
        }
    }

    func session(_ session: WCSession,
                 didReceiveApplicationContext applicationContext: [String : Any]) {
        let s = (applicationContext["text"] as? String) ?? String(describing: applicationContext)
        appendLog("didReceiveAppContext: \(s)")
        DispatchQueue.main.async { [weak self] in
            self?.lastMessage = s
            self?.receiveCount += 1
        }
    }
}
