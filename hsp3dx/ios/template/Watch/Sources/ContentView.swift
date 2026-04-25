//
//  ContentView.swift — Phase 1 skeleton
//
//  Phase 1: 時計 + "HSP runtime: skeleton" 表示。
//  Phase 2 以降で .ax interpreter を呼んで Canvas 描画に置換。
//

import SwiftUI

struct ContentView: View {
    @State private var now = Date()
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(spacing: 4) {
            // 時計 (placeholder、 Phase 2 で .ax で書き換え可能に)
            Text(timeString)
                .font(.system(size: 36, weight: .thin, design: .rounded))
                .monospacedDigit()
                .foregroundColor(.white)

            Text("HSP runtime: skeleton")
                .font(.caption2)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .ignoresSafeArea()
        .onReceive(timer) { input in
            now = input
        }
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
