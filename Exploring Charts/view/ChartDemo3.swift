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
    
    var body: some View {
        VStack {
            Text("Chart Demo 3")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Chart {
                ForEach(dailySales) { item in
                    switch(charType){
                    case .area:
                        AreaMark(x: valueDay(item), y: valueSale(item))
                    case .bar:
                        BarMark(x: valueDay(item), y: valueSale(item))
                            .foregroundStyle(by: valueDay(item))
                    case .line:
                        LineMark(x: valueDay(item), y: valueSale(item))
                    }
                }
            }
            HStack {
                ForEach(ChartType.allCases, id: \.self) { itemType in
                    Button(action: {
                        charType = itemType
                    }, label: {
                        Text(itemType.rawValue)
                    })
                    if itemType != ChartType.allCases.last {
                        Spacer()
                    }
                }
                
                
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
