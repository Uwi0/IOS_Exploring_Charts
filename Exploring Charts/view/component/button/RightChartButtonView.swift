import SwiftUI

struct RightChartButtonView: View {
    @Binding var isVerticalMode: Bool
    @Binding var titleAlignment: HorizontalAlignment
    private var degrees: Angle {
        .degrees(isVerticalMode ? 0 : 90)
    }
    
    var body: some View {
        VStack(spacing: 50) {
            Button(
                action: {
                withAnimation {
                    isVerticalMode.toggle()
                }
            }, 
                label: {
                Image(systemName: "align.vertical.bottom.fill")
                    .rotationEffect(degrees)
                    
            })
            TitleAlignmentButton(titleAlignment: $titleAlignment)
        }
        .padding()
    }
}

#Preview {
    HStack {
        Spacer()
        RightChartButtonView(
            isVerticalMode: .constant(true),
            titleAlignment: .constant(.leading)
        )
    }
}
