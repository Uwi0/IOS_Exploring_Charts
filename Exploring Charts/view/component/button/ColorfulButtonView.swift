import SwiftUI

struct ColorfulButtonView: View {
    @Binding var colors: [Color]
    @State private var flip: Bool = false
    
    let dim: CGFloat
    let offset: CGFloat
    let action: () -> Void
    
    private var count: CGFloat {
        CGFloat(colors.count)
    }
    private var factor: CGFloat {
        (dim - offset) / count
    }
    private var lastColor: Color {
        colors.last ?? .black
    }
    private var degress: Angle {
        flip ? .zero : .degrees(180)
    }
    
    var body: some View {
        ZStack {
            ForEach(0 ..< colors.count, id: \.self) { i in
                RandomArcFromColorsView(
                    colors: colors,
                    index: i,
                    minRadius: minRadius(i: i),
                    maxRadius: maxRadius(i: i),
                    opacity: 0.9
                )
            }
            Circle()
                .stroke(lastColor, lineWidth: factor)
                .frame(width: dim, height: dim)
        }
        .rotation3DEffect(
            degress,
            axis: (
                x: Double.random(in: -1...1),
                y: Double.random(in: -1...1),
                z: 0
            )
        )
        .onTapGesture {
            colors = Color.randomColorsN(n: colors.count)
            withAnimation {
                flip.toggle()
            }
            action()
        }
    }
    
    private func minRadius(i: Int) -> CGFloat {
        return factor * CGFloat(i) + offset
    }
    
    private func maxRadius(i: Int) -> CGFloat {
        return factor * CGFloat(i + 1) + offset
    }
}

#Preview {
    ColorfulButtonView(
        colors: .constant(Color.defaultColors),
        dim: 40,
        offset: 10,
        action: {
            
        }
    )
}
