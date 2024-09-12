import SwiftUI
import Charts

struct RuleMarkHorizontalView: ChartContent {
    
    let chartItem: ChartItemModel
    let salesOnSelectedDay: Double
    
    private var selectedDay: String {
        chartItem.selectedDay
    }
    private var intMode: Bool {
        chartItem.intMode
    }
    private var precision: Int {
        intMode ? 0 : 1
    }
    private var specifier: String {
        "%.\(precision)f"
    }
    private let lineColor = Color.red
    
    var body: some ChartContent {
        RuleMark(x: valueSale(amount: salesOnSelectedDay))
            .foregroundStyle(lineColor)
            .lineStyle(StrokeStyle(lineWidth: 2, dash: [5]))
            .annotation(position: .topTrailing, spacing: 0){
                Text("\(salesOnSelectedDay, specifier: specifier)")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
    }
}

