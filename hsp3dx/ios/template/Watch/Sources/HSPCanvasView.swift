//
//  HSPCanvasView.swift — SwiftUI Canvas が HSPRuntime の drawOps を描画する。
//
//  Phase 2: clear / setColor / boxF / text / setPos のみ。
//

import SwiftUI

struct HSPCanvasView: View {
    let ops: [HSPDrawOp]

    var body: some View {
        Canvas { ctx, size in
            var col = Color.white
            for op in ops {
                switch op {
                case .clear(let r, let g, let b):
                    let rect = CGRect(origin: .zero, size: size)
                    ctx.fill(Path(rect), with: .color(Color(red: r, green: g, blue: b)))
                case .setColor(let r, let g, let b):
                    col = Color(red: r, green: g, blue: b)
                case .boxF(let x, let y, let w, let h):
                    let rect = CGRect(x: x, y: y, width: w, height: h)
                    ctx.fill(Path(rect), with: .color(col))
                case .text(let x, let y, let s):
                    let resolved = ctx.resolve(Text(s).font(.system(size: 14)).foregroundColor(col))
                    ctx.draw(resolved, at: CGPoint(x: x, y: y), anchor: .topLeading)
                case .setPos:
                    break   // 現在位置は HSPRuntime 側が text の x/y に展開済み
                }
            }
        }
        .background(Color.black)
        .ignoresSafeArea()
    }
}

#Preview {
    HSPCanvasView(ops: [
        .clear(r: 0, g: 0, b: 0),
        .setColor(r: 1, g: 0, b: 0),
        .boxF(x: 20, y: 20, w: 80, h: 40),
        .setColor(r: 1, g: 1, b: 1),
        .text(x: 10, y: 80, s: "HSP on Watch"),
    ])
}
