import SwiftUI
import Charts

struct LineChartVerticalView: View {
    let dailySales: [DailySalesType]
    
    var body: some View {
        Chart {
            ForEach(dailySales) { item in
                LineMark(
                    x: valueDay(item),
                    y: valueSale(item)
                )
            }
        }
    }
}

#Preview {
    LineChartVerticalView(dailySales: defaultDailySales)
}
