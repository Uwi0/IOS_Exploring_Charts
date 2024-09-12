import SwiftUI
import Charts

struct AreaChartVerticalView: View {
    
    let chartItem: ChartItemModel
    
    var body: some View {
        Chart {
            ForEach(chartItem.dailySales) { item in
                AreaMark(
                    x: valueDay(item),
                    y: valueSale(item)
                )
            }
        }
    }
}

#Preview {
    AreaChartVerticalView(chartItem: .defaultChartItem)
}
