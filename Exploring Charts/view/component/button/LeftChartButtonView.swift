import SwiftUI

struct LeftChartButtonView: View {
    
    @Binding var chartItem: ChartItemModel
    private var degrees: Angle {
        .degrees(chartItem.isVerticalChart ? 0 : 90)
    }
    
    var body: some View {
        VStack {
            
            ForEach(ChartType.allCases, id: \.self) { itemType in
                Button(action: {
                    chartItem.charType = itemType
                }, label: {
                    Text(itemType.rawValue)
                })
                .rotationEffect(degrees)
                if itemType != ChartType.allCases.last {
                    Spacer()
                }
            }
            Spacer()
            ColorfulButtonView(
                chartItem: $chartItem,
                dim: 30,
                offset: 10,
                action: {}
            )
            
        }
        .padding()
    }
}

#Preview {
    HStack {
        LeftChartButtonView(chartItem: .constant(.defaultChartItem))
        Spacer()
    }
}
