import SwiftUI
import Charts

struct BarChartVerticalView: View {
    
    @Binding var chartItem: ChartItemModel
    @State private var isDragging: Bool = false
    
    private let min: Double = 0
    private let max: Double = 1000
    
    private var salesOnSelectedDay: Double {
        getSalesOfSelectedDay(
            dailySales: chartItem.dailySales,
            selectedDay: chartItem.selectedDay
        )
    }
    
    private var iconOpacity: CGFloat {
        chartItem.editMode ? 0.8 : 0.4
    }
    
    var body: some View {
        Chart {
            if isDragging {
                RuleMarkVerticalView(
                    chartItem: chartItem,
                    salesOnSelectedDay: salesOnSelectedDay
                )
            }
            
            ForEach(chartItem.dailySales) { item in
                BarMark(
                    x: valueDay(item),
                    y: valueSale(item)
                )
                .foregroundStyle(by: valueDay(item))
                .annotation(position: .top){
                    Image(systemName: "circle")
                        .fontWeight(.bold)
                        .foregroundStyle(.red)
                        .opacity(iconOpacity)
                }
            }
        }
        .chartForegroundStyleScale(range: chartItem.barColor)
        .chartYScale(domain: min ... max)
        .modifier(
            VerticalChartDragModifier(
                chartItem: $chartItem,
                isDragging: $isDragging)
        )
    }
}

#Preview {
    VStack {
        BarChartVerticalView(
            chartItem: .constant(.defaultChartItem)
        )
    }.padding()
}
