import SwiftUI
import Charts

struct LineAreaChartHorizontalView: View {
    
    private let min: Double = 0
    private let max: Double = 1000
    
    @Binding var chartItem: ChartItemModel
    @State private var isDragging: Bool = false
    
    private var salesOnSelectedDay: Double {
        getSalesOfSelectedDay(
            dailySales: chartItem.dailySales,
            selectedDay: chartItem.selectedDay
        )
    }
    
    var body: some View {
        Chart {
            ForEach(chartItem.dailySales) { item in
                
                if chartItem.charType == .area {
                    AreaMark(
                        x: valueSale(item),
                        y: valueDay(item)
                    )
                    .foregroundStyle(chartItem.lineAreaColor.opacity(0.3))
                }
                
                LineMark(
                    x: valueSale(item),
                    y: valueDay(item)
                )
                .foregroundStyle(chartItem.lineAreaColor)
                .symbol(){
                    AnnotateLineAreaGraph(chartItem: chartItem)
                }
            }
            
            if isDragging {
                RuleMarkHorizontalView(
                    chartItem: chartItem,
                    salesOnSelectedDay: salesOnSelectedDay
                )
            }
        }
        .chartXScale(domain: min ... max)
        .modifier(
            HorizontalChartDragModifier(
                chartItem: $chartItem,
                isDragging: $isDragging
            )
        )
    }
}

#Preview {
    LineAreaChartHorizontalView(chartItem: .constant(.defaultChartItem))
}
