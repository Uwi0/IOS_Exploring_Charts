import SwiftUI

struct ColorfulButtonView: View {
    
    @Binding var chartItem: ChartItemModel
    @State private var flip: Bool = false
    
    let dim: CGFloat
    let offset: CGFloat
    let action: () -> Void
    
    private var count: CGFloat {
        CGFloat(chartItem.barColor.count)
    }
    private var factor: CGFloat {
        (dim - offset) / count
    }
    private var lastColor: Color {
        chartItem.barColor.last ?? .black
    }
    private var degress: Angle {
        flip ? .zero : .degrees(180)
    }
    private var randomColor: [Color] {
        Color.randomColorsN(n: chartItem.barColor.count)
    }
    private var itemCount: Int {
        chartItem.barColor.count
    }
    
    var body: some View {
        ZStack {
            if chartItem.charType == .bar {
                ForEach(0 ..< itemCount, id: \.self) { i in
                    RandomArcFromColorsView(
                        colors: chartItem.barColor,
                        index: i,
                        minRadius: minRadius(i: i),
                        maxRadius: maxRadius(i: i),
                        opacity: 0.9
                    )
                }
                Circle()
                    .stroke(lastColor, lineWidth: factor)
                    .frame(width: dim, height: dim)
            } else {
                Circle()
                    .fill(chartItem.lineAreaColor)
                    .frame(width: dim, height: dim)
            }
            
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
            if chartItem.charType == .bar {
                chartItem.barColor = randomColor
            } else {
                chartItem.lineAreaColor = Color.random(colorList: colorsForLineAndArea)
            }
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
        chartItem: .constant(.defaultChartItem),
        dim: 40,
        offset: 10,
        action: {
            
        }
    )
}
