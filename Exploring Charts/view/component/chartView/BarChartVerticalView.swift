import SwiftUI
import Charts

struct BarChartVerticalView: View {
    let dailySales: [DailySalesType]
    let barColors: [Color]
    
    var body: some View {
        Chart {
            ForEach(dailySales) { item in
                BarMark(
                    x: valueDay(item),
                    y: valueSale(item)
                )
                .foregroundStyle(by: valueDay(item))
            }
        }
        .chartForegroundStyleScale(range: barColors)
    }
}

#Preview {
    BarChartVerticalView(dailySales: defaultDailySales, barColors: defaultBarColors)
}
