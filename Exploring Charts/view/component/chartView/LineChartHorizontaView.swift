import SwiftUI
import Charts

struct LineChartHorizontaView: View {
    
    let dailySales: [DailySalesType]
    
    var body: some View {
        Chart {
            ForEach(dailySales) { item in
                LineMark(
                    x: valueSale(item),
                    y: valueDay(item)
                )
            }
        }
    }
}

#Preview {
    LineChartHorizontaView(dailySales: defaultDailySales)
}
