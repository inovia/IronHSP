//
//  ContentView.swift — Phase 7: HSPRuntime + Canvas + WatchConnectivity + Crown/Tap/Haptic
//

import SwiftUI
import WatchKit
import UserNotifications

struct ContentView: View {
    @State private var ops: [HSPDrawOp] = []
    @State private var statusLine: String = ""
    @State private var rt: HSPRuntime? = nil
    @State private var fallback: Bool = false

    @StateObject private var wc = WatchConnectivityBridge.shared

    // Digital Crown 値 (連続的)。 HSPRuntime 側で整数化して累積デルタとして使う。
    @State private var crownValue: Double = 0
    @State private var crownLast:  Double = 0
    @State private var notifyCount: Int = 0

    private let timer = Timer.publish(every: 1.0 / 30.0, on: .main, in: .common)
        .autoconnect()

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            HSPCanvasView(ops: ops)

            VStack(alignment: .leading, spacing: 1) {
                Text("WC: \(wc.sessionState)\(wc.isReachable ? " ⟷" : "")")
                    .font(.system(size: 9))
                    .foregroundColor(wc.sessionState == "activated" ? .green : .yellow)
                if !wc.lastMessage.isEmpty {
                    Text("📩 \(wc.lastMessage)")
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(.white)
                        .padding(3)
                        .background(Color.blue.opacity(0.6))
                        .cornerRadius(3)
                }
            }
            .padding(.leading, 4)
            .padding(.top, 4)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)

            Text(statusLine)
                .font(.system(size: 9))
                .foregroundColor(.gray)
                .padding(.leading, 6)
                .padding(.bottom, 4)
        }
        .focusable(true)
        .digitalCrownRotation($crownValue, from: -10000, through: 10000,
                              by: 1, sensitivity: .medium, isContinuous: true,
                              isHapticFeedbackEnabled: false)
        .onTapGesture {
            rt?.tapCount += 1
        }
        .onAppear { load() }
        .onReceive(timer) { _ in tick() }
    }

    private func load() {
        if let url = Bundle.main.url(forResource: "demo", withExtension: "ax"),
           let data = try? Data(contentsOf: url),
           let runtime = try? HSPRuntime(data) {
            self.rt = runtime
            self.fallback = false
            self.statusLine = "demo.ax loaded"
            runtime.wcSendCallback = { msg in
                WatchConnectivityBridge.shared.sendToPhone(["text": msg])
            }
            runtime.hapticCallback = { type in
                let h: WKHapticType
                switch type {
                case 1: h = .success
                case 2: h = .failure
                case 3: h = .click
                case 4: h = .start
                case 5: h = .stop
                default: h = .notification
                }
                WKInterfaceDevice.current().play(h)
            }
            runtime.notifyCallback = { title, body in
                DispatchQueue.main.async { self.notifyCount += 1 }
                Self.scheduleNotification(title: title, body: body)
            }
            // Phase 10 (b): 通知権限を 1 度だけ要求
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, err in
                NSLog("[notify] auth granted=\(granted) err=\(err?.localizedDescription ?? "")")
            }
        } else {
            self.fallback = true
            self.ops = sampleOps()
            self.statusLine = "no demo.ax"
        }
    }

    private func tick() {
        guard let rt = rt, !fallback else { return }
        if rt.isHalted { return }
        // WC 受信転送
        if !wc.lastMessage.isEmpty, rt.wcLastMessage != wc.lastMessage {
            rt.wcLastMessage = wc.lastMessage
            rt.wcReadyFlag = true
        }
        // Crown delta 累積を runtime に転送
        let delta = crownValue - crownLast
        if delta != 0 {
            rt.crownDelta &+= Int32(delta.rounded())
            crownLast = crownValue
        }
        rt.runFrame()
        ops = rt.drawOps
        statusLine = "step=\(rt.step) ops=\(rt.drawOps.count) crn=\(rt.crownDelta) tap=\(rt.tapCount) ntf=\(notifyCount)"
    }

    /// Phase 10 (b): notify "title", "body" を即時 (trigger=nil) ローカル通知として投函
    private static func scheduleNotification(title: String, body: String) {
        // foreground でも banner を出すために delegate を都度差し直す
        UNUserNotificationCenter.current().delegate = NotificationForegroundDelegate.shared
        let content = UNMutableNotificationContent()
        content.title = title
        content.body  = body
        content.sound = .default
        let req = UNNotificationRequest(identifier: UUID().uuidString,
                                        content: content, trigger: nil)
        UNUserNotificationCenter.current().add(req) { err in
            if let err = err { NSLog("[notify] add err: \(err)") }
        }
    }

    private func sampleOps() -> [HSPDrawOp] {
        return [
            .clear(r: 0.05, g: 0.07, b: 0.12),
            .setColor(r: 1.0, g: 0.2, b: 0.3),
            .boxF(x: 12, y: 24, w: 64, h: 24),
            .setColor(r: 1, g: 1, b: 1),
            .text(x: 14, y: 56, s: "WC waiting...", size: 14),
        ]
    }
}

#Preview {
    ContentView()
}

/// Phase 10 (b): app が foreground のとき、 willPresent を実装しないと banner/list が出ない (iOS/watchOS 14+)
final class NotificationForegroundDelegate: NSObject, UNUserNotificationCenterDelegate {
    static let shared = NotificationForegroundDelegate()
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                 willPresent notification: UNNotification,
                                 withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .list, .sound])
    }
}
