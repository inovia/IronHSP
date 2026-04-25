//
//  ContentView.swift — Phase 4: HSPRuntime + Canvas + WatchConnectivity overlay
//

import SwiftUI

struct ContentView: View {
    @State private var ops: [HSPDrawOp] = []
    @State private var statusLine: String = ""
    @State private var rt: HSPRuntime? = nil
    @State private var fallback: Bool = false

    @StateObject private var wc = WatchConnectivityBridge.shared

    private let timer = Timer.publish(every: 1.0 / 30.0, on: .main, in: .common)
        .autoconnect()

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            HSPCanvasView(ops: ops)

            // 上部に WC ステータス + 最後のメッセージ
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
                if wc.receiveCount > 0 {
                    Text("rx=\(wc.receiveCount)")
                        .font(.system(size: 8))
                        .foregroundColor(.gray)
                }
                if !wc.debugLog.isEmpty {
                    Text(wc.debugLog)
                        .font(.system(size: 7))
                        .foregroundColor(.cyan)
                        .lineLimit(2)
                }
            }
            .padding(.leading, 4)
            .padding(.top, 4)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)

            // 下部に runtime status
            Text(statusLine)
                .font(.system(size: 9))
                .foregroundColor(.gray)
                .padding(.leading, 6)
                .padding(.bottom, 4)
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
        } else {
            self.fallback = true
            self.ops = sampleOps()
            self.statusLine = "no demo.ax"
        }
    }

    private func tick() {
        guard let rt = rt, !fallback else { return }
        if rt.isHalted { return }
        rt.runFrame()
        ops = rt.drawOps
        statusLine = "step=\(rt.step) ops=\(rt.drawOps.count)"
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
