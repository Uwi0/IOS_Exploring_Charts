import SwiftUI
import Charts

struct AreaChartHorizontaView: View {
    
    let dailySales: [DailySalesType]
    
    var body: some View {
        Chart {
            ForEach(dailySales) { item in
                AreaMark(
                    x: valueSale(item),
                    y: valueDay(item)
                )
            }
        }
    }
}

#Preview {
    AreaChartHorizontaView(dailySales: defaultDailySales)
}
