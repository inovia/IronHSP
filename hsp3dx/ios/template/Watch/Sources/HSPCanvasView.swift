//
//  HSPCanvasView.swift — SwiftUI Canvas が HSPRuntime の drawOps を描画する。
//
//  Phase 3: clear / setColor / boxF / line / pset / text(size) / setPos
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
                    ctx.fill(Path(CGRect(x: x, y: y, width: w, height: h)),
                             with: .color(col))
                case .line(let x1, let y1, let x2, let y2):
                    var path = Path()
                    path.move(to: CGPoint(x: x1, y: y1))
                    path.addLine(to: CGPoint(x: x2, y: y2))
                    ctx.stroke(path, with: .color(col), lineWidth: 1)
                case .pset(let x, let y):
                    ctx.fill(Path(CGRect(x: x, y: y, width: 1, height: 1)),
                             with: .color(col))
                case .text(let x, let y, let s, let size):
                    let resolved = ctx.resolve(
                        Text(s).font(.system(size: size)).foregroundColor(col)
                    )
                    ctx.draw(resolved, at: CGPoint(x: x, y: y), anchor: .topLeading)
                case .setPos:
                    break
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
        .setColor(r: 1, g: 0.2, b: 0.3),
        .boxF(x: 20, y: 20, w: 80, h: 40),
        .setColor(r: 0.2, g: 1, b: 0.6),
        .line(x1: 10, y1: 80, x2: 150, y2: 100),
        .setColor(r: 1, g: 1, b: 1),
        .text(x: 10, y: 110, s: "HSP on Watch", size: 14),
    ])
}
