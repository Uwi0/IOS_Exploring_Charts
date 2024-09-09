import SwiftUI
import Charts

struct BarChartHorizontalView: View {
    let dailySales: [DailySalesType]
    let barColors: [Color]
    
    var body: some View {
        Chart {
            ForEach(dailySales) { item in
                BarMark(
                    x: valueSale(item),
                    y: valueDay(item)
                )
                .foregroundStyle(by: valueDay(item))
            }
        }
        .chartForegroundStyleScale(range: barColors)
    }
}

#Preview {
    BarChartHorizontalView(
        dailySales: defaultDailySales,
        barColors: defaultBarColors
    )
}
