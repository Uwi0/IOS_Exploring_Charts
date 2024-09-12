import SwiftUI
import Charts

struct LineChartVerticalView: View {
    
    let chartItem: ChartItemModel
    
    var body: some View {
        Chart {
            ForEach(chartItem.dailySales) { item in
                LineMark(
                    x: valueDay(item),
                    y: valueSale(item)
                )
            }
        }
    }
}

#Preview {
    LineChartVerticalView(chartItem: .defaultChartItem)
}
