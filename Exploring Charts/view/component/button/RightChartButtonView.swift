import SwiftUI

struct RightChartButtonView: View {
    
    @Binding var chartItem: ChartItemModel
    
    private var degrees: Angle {
        .degrees(chartItem.isVerticalChart ? 0 : 90)
    }
    
    var body: some View {
        VStack(spacing: 50) {
            Button(
                action: {
                withAnimation {
                    chartItem.isVerticalChart.toggle()
                }
            }, 
                label: {
                Image(systemName: "align.vertical.bottom.fill")
                    .rotationEffect(degrees)
                    
            })
            TitleAlignmentButton(titleAlignment: $chartItem.titleAlignment)
        }
        .padding()
    }
}

#Preview {
    HStack {
        Spacer()
        RightChartButtonView(chartItem: .constant(.defaultChartItem))
    }
}
