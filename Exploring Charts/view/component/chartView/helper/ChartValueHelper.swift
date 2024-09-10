import SwiftUI
import Charts

let keyDay = "Day"
let keySale = "Sales"

func valueDay(_ item: DailySalesType) -> PlottableValue<String> {
    .value(keyDay, item.day)
}

func valueSale(_ item: DailySalesType) -> PlottableValue<Double> {
        .value(keySale, item.sales)
}

func valueSale(amount: Double) -> PlottableValue<Double> {
    .value(keySale, amount)
}
