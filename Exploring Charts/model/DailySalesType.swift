import SwiftUI

struct DailySalesType: Identifiable {
    let id = UUID()
    let day: String
    let sales: Int
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
