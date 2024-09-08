import SwiftUI
import Charts

struct BarChartVerticalView: View {
    let dailySales: [DailySalesType]
    
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
    }
}

#Preview {
    BarChartVerticalView(dailySales: defaultDailySales)
}
