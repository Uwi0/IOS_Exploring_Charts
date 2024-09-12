import SwiftUI
import Charts

struct AreaChartHorizontaView: View {
    
    let chartItem: ChartItemModel
    
    var body: some View {
        Chart {
            ForEach(chartItem.dailySales) { item in
                AreaMark(
                    x: valueSale(item),
                    y: valueDay(item)
                )
            }
        }
    }
}

#Preview {
    AreaChartHorizontaView(chartItem: .defaultChartItem)
}
