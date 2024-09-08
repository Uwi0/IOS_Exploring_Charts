import SwiftUI

struct ChartDemo1: View {
    @State var colors: [Color]
    
    @State private var rotateBar: Bool = false
    @State private var tilt: CGFloat = 0.0
    private let threshold = 30.0
    private var count: CGFloat {
        CGFloat(colors.count)
    }
    private var barWidth: CGFloat {
        (UIScreen.main.bounds.width / count) - 5
    }
    private var degrees: Angle {
        .degrees(rotateBar ? 180: 0)
    }
    private var scale: CGFloat {
        tilt != 0 ? 0.8 : 1
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
                    .rotation3DEffect(degrees, axis: (x: 0, y: 1, z: 0))
                }
            }
            .rotation3DEffect(degrees, axis: (x: 0, y: 1, z: 0))
            .rotation3DEffect(.degrees(-tilt * 45.0), axis: (x: 0, y: 1, z: 0))
            .scaleEffect(scale)
            .gesture(DragGesture().onChanged { value in
                withAnimation {
                    changeTilt(value)
                }
            })
            .onTapGesture {
                withAnimation {
                    tilt = 0
                }
            }
            .navigationTitle("Demo")
            .toolbar() {
                ToolbarItem(placement: .bottomBar) {
                    ColorfulButtonView(
                        colors: $colors,
                        dim: 50,
                        offset: 10,
                        action: {
                            withAnimation {
                                rotateBar.toggle()
                            }
                        })
                }
            }
        }
    }
    
    private func changeTilt(_ value: DragGesture.Value) {
        if value.translation.width > threshold {
            tilt = -1
        } else if value.translation.width < -threshold {
            tilt = 1
        }else {
            tilt = 0
        }
    }
    
    
}

#Preview {
    ChartDemo1(colors: Color.defaultColors)
}
