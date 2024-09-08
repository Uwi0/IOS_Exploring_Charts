import SwiftUI

struct TestColorButtonView: View {
    @State var colors: [Color]
    
    @State private var rotateBar: Bool = false
    @State private var tilt: CGFloat = 0.0
    private var count: CGFloat {
        CGFloat(colors.count)
    }
    private var barWidth: CGFloat {
        (UIScreen.main.bounds.width / count) - 5
    }
    
    var body: some View {
        NavigationStack {
            HStack(alignment: .bottom, spacing: 3) {
                ForEach(colors, id: \.self) { color in
                    let height = Double.random(in: 50...200)
                    BorderedRectangleView(
                        color: color,
                        barWidth: barWidth,
                        height: height
                    )
                }
            }
        }
    }
}

#Preview {
    TestColorButtonView(colors: Color.defaultColors)
}
