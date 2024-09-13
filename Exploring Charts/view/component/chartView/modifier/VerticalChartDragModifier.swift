import SwiftUI
import Charts

struct VerticalChartDragModifier: ViewModifier {
    
    @Binding var chartItem: ChartItemModel
    @Binding var isDragging: Bool
    
    private let innerProxyColor: Color = .clear
    private let min: Double = 0
    private let max: Double = 1000
    
    func body(content: Content) -> some View {
        content.chartOverlay { proxy in
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
            let (newDay, sales) = newDayAndSale(location: location, proxy: proxy)
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
    
    private func newDayAndSale(location: CGPoint, proxy: ChartProxy) -> (String, Double) {
        typealias type = (String, Double)
        let defaultValue: (String, Double) = ("Error", -1)
        let value = proxy.value(at: location, as: type.self) ?? defaultValue
        return value
    }
}
