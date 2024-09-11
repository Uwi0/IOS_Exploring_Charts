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
}
