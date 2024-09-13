import SwiftUI
import Charts

struct BarChartHorizontalView: View {
    
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
            if isDragging {
                RuleMarkHorizontalView(
                    chartItem: chartItem,
                    salesOnSelectedDay: salesOnSelectedDay
                )
            }
            ForEach(chartItem.dailySales) { item in
                BarMark(
                    x: valueSale(item),
                    y: valueDay(item)
                )
                .foregroundStyle(by: valueDay(item))
            }
        }
        .chartForegroundStyleScale(range: chartItem.barColor)
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
    BarChartHorizontalView(chartItem: .constant(.defaultChartItem))
}
