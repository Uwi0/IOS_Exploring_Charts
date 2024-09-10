import SwiftUI
import Charts

struct ChartDemo3: View {
    
    let min: Double
    let max: Double
    let xAxisMarkPosition: AxisMarkPosition = .bottom
    let yAxisMarkPosition: AxisMarkPosition = .leading
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
                case .area: AreaChartVerticalView(dailySales: dailySales)
                case .bar: BarChartVerticalView(
                    barColors: barColors,
                    isEditMode: true,
                    selectedDay: .constant("Tue"),
                    dailySales: $dailySales
                )
                case .line: LineChartVerticalView(dailySales: dailySales)
                }
            } else {
                switch(chartType) {
                case .area: AreaChartHorizontaView(dailySales: dailySales)
                case .bar: BarChartHorizontalView(dailySales: dailySales, barColors: barColors)
                case .line: LineChartHorizontaView(dailySales: dailySales)
                }
            }
            
            HStack {
                ColorfulButtonView(
                    colors: $barColors,
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
