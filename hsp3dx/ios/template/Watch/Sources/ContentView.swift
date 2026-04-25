//
//  ContentView.swift — Phase 3: HSPRuntime の frame loop 駆動
//
//  動作:
//    1. Bundle に "demo.ax" あれば HSPRuntime で読み込む
//    2. 60 Hz Timer で runFrame() を呼び、 wait/await で yield されたら次 tick
//    3. drawOps を Canvas に流す
//

import SwiftUI

struct ContentView: View {
    @State private var ops: [HSPDrawOp] = []
    @State private var statusLine: String = ""
    @State private var rt: HSPRuntime? = nil
    @State private var fallback: Bool = false

    private let timer = Timer.publish(every: 1.0 / 30.0, on: .main, in: .common)
        .autoconnect()

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            HSPCanvasView(ops: ops)
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
            .setColor(r: 0.2, g: 0.8, b: 1.0),
            .boxF(x: 84, y: 24, w: 64, h: 24),
            .setColor(r: 1, g: 1, b: 1),
            .text(x: 14, y: 56, s: "HSP runtime ready", size: 14),
        ]
    }
}

#Preview {
    ContentView()
}
