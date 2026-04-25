//
//  hsp3dxWatchApp.swift — watchOS app entry point
//
//  HSP for Apple Watch ランタイムのスケルトン。
//  Phase 1: SwiftUI App skelton + 時計 + status text のみ。
//  Phase 2 以降で .ax (HSP bytecode) interpreter を載せる。
//

import SwiftUI

@main
struct hsp3dxWatchApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
