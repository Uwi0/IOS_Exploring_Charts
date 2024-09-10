import SwiftUI
import Charts

struct RuleMarkView: ChartContent {
    
    let selectedDay: String
    let salesOnSelectedDay: Double
    let intMode: Bool
    
    private let lineColor = Color.red
    
    private var precision: Int {
        intMode ? 0 : 1
    }
    private var specifier: String {
        "%.\(precision)f"
    }
    
    var body: some ChartContent {
        RuleMark(y: valueSale(amount: salesOnSelectedDay))
            .foregroundStyle(lineColor)
            .lineStyle(StrokeStyle(lineWidth: 2, dash: [5]))
            .annotation(position: .topTrailing, spacing: 0){
                Text("\(salesOnSelectedDay, specifier: specifier)")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
    }
}
