import SwiftUI
import Charts

func valueDay(_ item: DailySalesType) -> PlottableValue<String> {
    .value("Day", item.day)
}

func valueSale(_ item: DailySalesType) -> PlottableValue<Int> {
        .value("Sale", item.sales)
}
