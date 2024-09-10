import SwiftUI
import Charts

struct BarChartVerticalView: View {
    let dailySales: [DailySalesType]
    let barColors: [Color]
    
    var body: some View {
        Chart {
            ForEach(dailySales) { item in
                BarMark(
                    x: valueDay(item),
                    y: valueSale(item)
                )
                .foregroundStyle(by: valueDay(item))
            }
            
            RuleMarkView(
                selectedDay: "Tues",
                salesOnSelectedDay: 123.4567,
                intMode: true
            )
        }
        .chartForegroundStyleScale(range: barColors)
    }
}

#Preview {
    VStack {
        BarChartVerticalView(dailySales: defaultDailySales, barColors: defaultBarColors)
    }.padding()
}
