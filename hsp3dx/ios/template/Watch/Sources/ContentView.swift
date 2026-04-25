//
//  ContentView.swift — Phase 2: HSP runtime + Canvas 描画
//
//  Bundle 内に "demo.ax" があれば HSPRuntime で実行し DrawList を構築する。
//  無ければハンドメイドの DrawList で Canvas pipeline を確認する。
//

import SwiftUI

struct ContentView: View {
    @State private var ops: [HSPDrawOp] = []
    @State private var statusLine: String = "loading…"
    @State private var now = Date()
    private let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            HSPCanvasView(ops: ops)
            VStack(alignment: .leading, spacing: 1) {
                Text(timeString)
                    .font(.system(size: 12, weight: .regular, design: .monospaced))
                    .foregroundColor(.white.opacity(0.85))
                Text(statusLine)
                    .font(.system(size: 9))
                    .foregroundColor(.gray)
            }
            .padding(.leading, 6)
            .padding(.bottom, 4)
        }
        .onAppear { reload() }
        .onReceive(timer) { now = $0 }
    }

    private func reload() {
        if let url = Bundle.main.url(forResource: "demo", withExtension: "ax"),
           let data = try? Data(contentsOf: url),
           let rt = try? HSPRuntime(data) {
            rt.run()
            ops = rt.drawOps
            statusLine = "demo.ax steps=\(rt.step) ops=\(rt.drawOps.count)"
        } else {
            ops = sampleOps()
            statusLine = "no demo.ax — fallback"
        }
    }

    private func sampleOps() -> [HSPDrawOp] {
        return [
            .clear(r: 0.05, g: 0.07, b: 0.12),
            .setColor(r: 1.0, g: 0.2, b: 0.3),
            .boxF(x: 12, y: 24, w: 64, h: 24),
            .setColor(r: 0.2, g: 0.8, b: 1.0),
            .boxF(x: 84, y: 24, w: 64, h: 24),
            .setColor(r: 1, g: 1, b: 1),
            .text(x: 14, y: 56, s: "HSP runtime ready"),
        ]
    }

    private var timeString: String {
        let f = DateFormatter()
        f.dateFormat = "HH:mm:ss"
        return f.string(from: now)
    }
}

#Preview {
    ContentView()
}
