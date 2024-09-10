import SwiftUI

struct RandomArcFromColorsView: View {
    
    let colors: [Color]
    let index: Int
    let minRadius: CGFloat
    let maxRadius: CGFloat
    let opacity: CGFloat
    
    private let start = Double.random(in: 0...0.5)
    private let endTrim = 1.0
    
    private var isValidIndex: Bool {
        index < colors.count && index >= 0
    }
    private var theIndex: Int {
        isValidIndex ? index : 0
    }
    private var count: CGFloat {
        CGFloat(colors.count)
    }
    private var color: Color {
        colors[theIndex]
    }
    private var endRadius: CGFloat {
        minRadius + maxRadius / count
    }
    private var rotation: CGFloat {
        Double.random(in: 0...360)
    }
    
    var body: some View {
        ArcView(color: color.opacity(opacity), startRadius: minRadius, endRadius: endRadius, startTim: start, endTrim: endTrim, rotate: rotation)
    }
}

#Preview {
    RandomArcFromColorsView(
        colors: Color.defaultColors,
        index: 8,
        minRadius: 170,
        maxRadius: 180,
        opacity: 0.9
    )
}
