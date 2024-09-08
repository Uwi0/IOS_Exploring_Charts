import SwiftUI
import Charts

struct AreaChartVerticalView: View {
    
    let dailySales: [DailySalesType]
    
    var body: some View {
        Chart {
            ForEach(dailySales) { item in
                AreaMark(
                    x: valueDay(item),
                    y: valueSale(item)
                )
            }
        }
    }
}

#Preview {
    AreaChartVerticalView(dailySales: defaultDailySales)
}
