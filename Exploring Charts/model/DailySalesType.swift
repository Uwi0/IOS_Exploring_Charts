import SwiftUI

struct DailySalesType: Identifiable {
    let id = UUID()
    let day: String
    let sales: Double
}

func getSalesOfSelectedDay(
    dailySales: [DailySalesType],
    selectedDay: String
) -> Double {
    if let i = dailySales.firstIndex(where: { $0.day == selectedDay}) {
        return dailySales[i].sales
    }else {
        return 0
    }
}

func setSalesOfSelectedDay( dailySales: inout [DailySalesType], selectedDay: String, sales: Double, min: Double, max: Double) {
    if let i = dailySales.firstIndex(where: { $0.day == selectedDay}) {
        var newSales: Double
        if sales <= min {
            newSales = min
        } else if sales >= max {
            newSales = max
        } else {
            newSales = sales
        }
        
        dailySales[i] = DailySalesType(day: dailySales[i].day, sales: newSales)
    }
}

let defaultDailySales: [DailySalesType] = [
    .init(
        day: "Sun",
        sales: 429),
    .init(
        day: "Mon",
        sales: 20),
    .init(
        day: "Tues",
        sales: 306),
    .init(
        day: "Wed",
        sales: 151),
    .init(
        day: "Thu",
        sales: 101),
    .init(
        day: "Fri",
        sales: 120),
    .init(
        day: "Sat",
        sales: 215)
]

let defaultBarColors: [Color] = [
    .pink,
    .green,
    .mint,
    .purple,
    .indigo,
    .red,
    .brown
]
