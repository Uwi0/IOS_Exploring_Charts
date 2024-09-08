import SwiftUI
import Charts

struct BarChartHorizontalView: View {
    let dailySales: [DailySalesType]
    
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
    }
}

#Preview {
    BarChartHorizontalView(dailySales: defaultDailySales)
}
