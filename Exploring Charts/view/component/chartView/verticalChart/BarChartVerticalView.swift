import SwiftUI
import Charts

struct BarChartVerticalView: View {
    
    @Binding var chartItem: ChartItemModel
    
    private let innerProxyColor: Color = .clear
    @State private var isDragging: Bool = false
    
    private let min: Double = 0
    private let max: Double = 1000
    
    private var salesOnSelectedDay: Double {
        getSalesOfSelectedDay(
            dailySales: chartItem.dailySales,
            selectedDay: chartItem.selectedDay
        )
    }
    
    private var iconOpacity: CGFloat {
        chartItem.editMode ? 0.8 : 0.4
    }
    
    var body: some View {
        Chart {
            if isDragging {
                RuleMarkVerticalView(
                    chartItem: chartItem,
                    salesOnSelectedDay: salesOnSelectedDay
                )
            }
            
            ForEach(chartItem.dailySales) { item in
                BarMark(
                    x: valueDay(item),
                    y: valueSale(item)
                )
                .foregroundStyle(by: valueDay(item))
                .annotation(position: .top){
                    Image(systemName: "circle")
                        .fontWeight(.bold)
                        .foregroundStyle(.red)
                        .opacity(iconOpacity)
                }
            }
        }
        .chartForegroundStyleScale(range: chartItem.barColor)
        .chartYScale(domain: min ... max)
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

#Preview {
    VStack {
        BarChartVerticalView(
            chartItem: .constant(.defaultChartItem)
        )
    }.padding()
}
