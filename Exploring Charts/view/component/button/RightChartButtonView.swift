import SwiftUI

struct RightChartButtonView: View {
    @Binding var isVerticalMode: Bool
    private var degrees: Angle {
        .degrees(isVerticalMode ? 0 : 90)
    }
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    isVerticalMode.toggle()
                }
            }, label: {
                Image(systemName: "align.vertical.bottom.fill")
                    .rotationEffect(degrees)
                    
            })
            
        }
        .padding()
    }
}

#Preview {
    HStack {
        Spacer()
        RightChartButtonView(isVerticalMode: .constant(true))
    }
}
