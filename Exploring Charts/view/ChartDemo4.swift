import SwiftUI
import Charts

struct ChartDemo4: View {
    let dailySales: [DailySalesType]
    let min: Double
    let max: Double
    let xAxisMarkPosition: AxisMarkPosition = .bottom
    let yAxisMarkPosition: AxisMarkPosition = .leading
    @State private var chartType: ChartType = .bar
    @State private var isVerticalChart = true
    @State private var barColors: [Color] = defaultBarColors
    @State var title = "Chart Title"
    @State var titleAlignment: HorizontalAlignment = .trailing
    
    var body: some View {
        HStack {
            
            LeftChartButtonView(
                chartType: $chartType,
                barColors: $barColors,
                isVerticalMode: $isVerticalChart
            )
            
            VStack(alignment: titleAlignment) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                if isVerticalChart {
                    switch(chartType) {
                    case .area: AreaChartVerticalView(dailySales: dailySales)
                    case .bar: BarChartVerticalView(dailySales: dailySales, barColors: barColors)
                    case .line: LineChartVerticalView(dailySales: dailySales)
                    }
                } else {
                    switch(chartType) {
                    case .area: AreaChartHorizontaView(dailySales: dailySales)
                    case .bar: BarChartHorizontalView(dailySales: dailySales, barColors: barColors)
                    case .line: LineChartHorizontaView(dailySales: dailySales)
                    }
                }
            }
            
            
            
            RightChartButtonView(
                isVerticalMode: $isVerticalChart,
                titleAlignment: $titleAlignment
            )
        }.padding()
        
    }
    
}

#Preview {
    ChartDemo4(
        dailySales: defaultDailySales,
        min: 0.0,
        max: 700.0)
}
