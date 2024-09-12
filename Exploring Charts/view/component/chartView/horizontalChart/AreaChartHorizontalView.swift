import SwiftUI
import Charts

struct AreaChartHorizontalView: View {
    
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
    AreaChartHorizontalView(chartItem: .defaultChartItem)
}
