import SwiftUI
import Charts

struct ChartDemo4: View {
    
    @Binding var chartItem: ChartItemModel
    
    var body: some View {
        if chartItem.isVerticalChart {
            switch(chartItem.charType) {
            case .bar: BarChartVerticalView(chartItem: $chartItem)
            case .line, .area: LineAreaChartVerticalView(chartItem: $chartItem)
            }
        } else {
            switch(chartItem.charType) {
            case .bar: BarChartHorizontalView(chartItem: $chartItem)
            case .line, .area : LineAreaChartHorizontalView(chartItem: $chartItem)
            }
        }
    }
    
}

#Preview {
    ChartDemo4(chartItem: .constant(.defaultChartItem))
}
