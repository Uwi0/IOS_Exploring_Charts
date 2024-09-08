import SwiftUI
import Charts

struct ChartDemo3: View {
    let dailySales: [DailySalesType]
    let min: Double
    let max: Double
    let barColors: [Color]
    let xAxisMarkPosition: AxisMarkPosition = .bottom
    let yAxisMarkPosition: AxisMarkPosition = .leading
    @State private var charType: ChartType = .bar
    @State private var isVerticalChart = true
    private var degrees: Angle {
        .degrees(isVerticalChart ? 0 : 90)
    }
    
    var body: some View {
        VStack let extractedExpr = Chart {
            ForEach(dailySales) { item in
                if isVerticalChart {
                    switch(charType){
                    case .area:
                        AreaMark(
                            x: valueDay(item),
                            y: valueSale(item)
                        )
                    case .bar:
                        BarMark(
                            x: valueDay(item),
                            y: valueSale(item)
                        ).foregroundStyle(by: valueDay(item))
                    case .line:
                        LineMark(
                            x: valueDay(item),
                            y: valueSale(item)
                        )
                    }
                } else {
                    switch(charType){
                    case .area:
                        AreaMark(
                            x: valueSale(item),
                            y: valueDay(item)
                        )
                    case .bar:
                        BarMark(
                            x: valueSale(item),
                            y: valueDay(item)
                        ).foregroundStyle(by: valueDay(item))
                    case .line:
                        LineMark(
                            x: valueSale(item),
                            y: valueDay(item)
                        )
                    }
                }
            }
        }
        {
            Text("Chart Demo 3")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            extractedExpr
            HStack {
                ForEach(ChartType.allCases, id: \.self) { itemType in
                    Button(action: {
                        charType = itemType
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
    
    
    private func valueDay(_ item: DailySalesType) -> PlottableValue<String> {
        .value("Day", item.day)
    }
    
    private func valueSale(_ item: DailySalesType) -> PlottableValue<Int> {
            .value("Sale", item.sales)
    }
}

#Preview {
    ChartDemo3(
        dailySales: defaultDailySales,
        min: 0.0,
        max: 700.0,
        barColors: defaultBarColors
    )
}
