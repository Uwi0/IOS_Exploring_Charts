import SwiftUI
import Charts

struct ChartDemo3: View {
    
    let min: Double
    let max: Double
    @State private var chartItem: ChartItemModel = .defaultChartItem
    @State private var dailySales: [DailySalesType] = defaultDailySales
    @State private var chartType: ChartType = .bar
    @State private var isVerticalChart = true
    @State private var barColors: [Color] = defaultBarColors
    private var degrees: Angle {
        .degrees(isVerticalChart ? 0 : 90)
    }
    
    var body: some View {
        VStack {
            Text("Chart Demo 3")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            if isVerticalChart {
                switch(chartType) {
                case .area: AreaChartVerticalView(chartItem: chartItem)
                case .bar: BarChartVerticalView(chartItem: $chartItem)
                case .line: LineAreaChartVerticalView(chartItem: $chartItem)
                }
            } else {
                switch(chartType) {
                case .area: AreaChartHorizontalView(chartItem: chartItem)
                case .bar: BarChartHorizontalView(chartItem: $chartItem)
                case .line: LineAreaChartHorizontalView(chartItem: $chartItem)
                }
            }
            
            HStack {
                ColorfulButtonView(
                    chartItem: $chartItem,
                    dim: 30,
                    offset: 10,
                    action: {
                        withAnimation {
//                            rotateBar.toggle()
                        }
                    })
                Spacer()
                ForEach(ChartType.allCases, id: \.self) { itemType in
                    Button(action: {
                        chartType = itemType
                    }, label: {
                        Text(itemType.rawValue)
                    })
                    .rotationEffect(degrees)
                    if itemType != ChartType.allCases.last {
                        Spacer()
                    }
                }
                Spacer()
                Button(action: {
                    withAnimation {
                        isVerticalChart.toggle()
                    }
                }, label: {
                    Image(systemName: "align.vertical.bottom.fill")
                        .rotationEffect(degrees)
                })
                
            }
            .padding()
        }
        .padding()
    }
    
}

#Preview {
    ChartDemo3(
        min: 0.0,
        max: 700.0
    )
}
