import SwiftUI
import Charts

struct LineChartVerticalView: View {
    
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
    
    var body: some View {
        Chart {
            ForEach(chartItem.dailySales) { item in
                LineMark(
                    x: valueDay(item),
                    y: valueSale(item)
                )
                .foregroundStyle(chartItem.lineAreaColor)
                .symbol(){
                    AnnotateLineAreaGraph(chartItem: chartItem)
                }
                
                if isDragging {
                    RuleMarkVerticalView(
                        chartItem: chartItem,
                        salesOnSelectedDay: salesOnSelectedDay
                    )
                }
            }
        }
        .chartYScale(domain: min ... max)
        .modifier(
            VerticalChartDragModifier(
                chartItem: $chartItem,
                isDragging: $isDragging)
        )
    }
}

#Preview {
    LineChartVerticalView(chartItem: .constant(.defaultChartItem))
}
