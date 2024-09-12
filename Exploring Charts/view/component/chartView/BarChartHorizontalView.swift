import SwiftUI
import Charts

struct BarChartHorizontalView: View {
    
    let chartItem: ChartItemModel
    
    var body: some View {
        Chart {
            ForEach(chartItem.dailySales) { item in
                BarMark(
                    x: valueSale(item),
                    y: valueDay(item)
                )
                .foregroundStyle(by: valueDay(item))
            }
        }
        .chartForegroundStyleScale(range: chartItem.barColor)
    }
}

#Preview {
    BarChartHorizontalView(chartItem: defaultChartItem)
}
