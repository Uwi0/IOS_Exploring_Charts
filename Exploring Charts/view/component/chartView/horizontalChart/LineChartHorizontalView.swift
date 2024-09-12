import SwiftUI
import Charts

struct LineChartHorizontalView: View {
    
    private let min: Double = 0
    private let max: Double = 1000
    
    @Binding var chartItem: ChartItemModel
    
    private let innerProxyColor: Color = .clear
    @State private var isDragging: Bool = false
    
    private var salesOnSelectedDay: Double {
        getSalesOfSelectedDay(
            dailySales: chartItem.dailySales,
            selectedDay: chartItem.selectedDay
        )
    }
    
    var body: some View {
        Chart {
            ForEach(chartItem.dailySales) { item in
                LineMark(
                    x: valueSale(item),
                    y: valueDay(item)
                )
                .foregroundStyle(chartItem.lineAreaColor)
                .symbol(){
                    AnnotateLineAreaGraph(chartItem: chartItem)
                }
            }
        }
        .chartXScale(domain: min ... max)
        .chartOverlay { proxy in
            ChartOverLay(proxy: proxy)
        }
    }
    
    private func ChartOverLay(proxy: ChartProxy) -> GeometryReader<some View> {
        GeometryReader { innerProxy in
            Rectangle()
                .fill(innerProxyColor)
                .contentShape(Rectangle())
                .gesture(DragGesture()
                    .onChanged { value in
                        onRuleMarkDragged(value: value, proxy: proxy)
                    }
                    .onEnded { value in
                        onDragEnded()
                    }
                )
        }
    }
    
    private func onRuleMarkDragged(value: DragGesture.Value, proxy: ChartProxy){
        if chartItem.editMode {
            isDragging = true
            let location = value.location
            let (sales, newDay) = newDayAndSale(location: location, proxy: proxy)
            chartItem.selectedDay = newDay
            setSalesOfSelectedDay(
                dailySales: &chartItem.dailySales,
                selectedDay: chartItem.selectedDay,
                sales: sales,
                min: min,
                max: max
            )
            
        }
    }
    
    private func onDragEnded(){
        isDragging = false
    }
    
    private func newDayAndSale(location: CGPoint, proxy: ChartProxy) -> (Double, String) {
        typealias type = (Double, String)
        let defaultValue: (Double, String) = (-1, "Error")
        let value = proxy.value(at: location, as: type.self) ?? defaultValue
        return value
    }
}

#Preview {
    LineChartHorizontalView(chartItem: .constant(.defaultChartItem))
}
