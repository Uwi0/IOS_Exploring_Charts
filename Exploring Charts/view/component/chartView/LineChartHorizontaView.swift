import SwiftUI
import Charts

struct LineChartHorizontaView: View {
    
    let chartItem: ChartItemModel
    
    var body: some View {
        Chart {
            ForEach(chartItem.dailySales) { item in
                LineMark(
                    x: valueSale(item),
                    y: valueDay(item)
                )
            }
        }
    }
}

#Preview {
    LineChartHorizontaView(chartItem: defaultChartItem)
}
