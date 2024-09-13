import SwiftUI

struct ChartItemModel: Identifiable {
    let id = UUID()
    var dailySales: [DailySalesType]
    var barColor: [Color]
    var editMode: Bool
    var selectedDay: String
    var title: String
    var titleAlignment: HorizontalAlignment
    var charType: ChartType
    var isVerticalChart: Bool
    var intMode: Bool
    var lineAreaColor: Color
    var showBorder: Bool
    
    static let defaultChartItem = ChartItemModel(
        dailySales: defaultDailySales,
        barColor: defaultBarColors,
        editMode: false,
        selectedDay: "Sun",
        title: "Chart 4 Demo",
        titleAlignment: .leading,
        charType: .bar,
        isVerticalChart: true,
        intMode: true,
        lineAreaColor: .purple,
        showBorder: true
    )
}

