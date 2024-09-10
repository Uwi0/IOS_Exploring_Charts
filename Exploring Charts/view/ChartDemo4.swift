import SwiftUI
import Charts

struct ChartDemo4: View {
    @State private var dailySales: [DailySalesType] = defaultDailySales
    @State private var chartType: ChartType = .bar
    @State private var isVerticalChart = true
    @State private var barColors: [Color] = defaultBarColors
    @State private var title = "Chart Title"
    @State private var titleAlignment: HorizontalAlignment = .trailing
    @State private var isEditMode: Bool = false
    @State private var selectedDay: String = "Sun"
    
    private var editModeIcon: String {
        isEditMode ? "checkmark" : "square.and.pencil"
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(
                    action: {
                        withAnimation {
                            isEditMode.toggle()
                        }
                    },
                    label: {
                        Image(systemName: editModeIcon)
                    }
                )
                if !isEditMode {
                    Spacer()
                    Button(
                        action: {
                            withAnimation {
                                //TODO: Sharing
                            }
                        },
                        label: {
                            Image(systemName: "square.and.arrow.up")
                        }
                    )
                }
            }
            HStack {
                
                if isEditMode {
                    LeftChartButtonView(
                        chartType: $chartType,
                        barColors: $barColors,
                        isVerticalMode: $isVerticalChart
                    )
                }
                
                VStack(alignment: titleAlignment) {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.semibold)
                    if isVerticalChart {
                        switch(chartType) {
                        case .area: AreaChartVerticalView(dailySales: dailySales)
                        case .bar: BarChartVerticalView(
                            barColors: barColors,
                            isEditMode: isEditMode, 
                            selectedDay: $selectedDay,
                            dailySales: $dailySales
                        )
                        case .line: LineChartVerticalView(dailySales: dailySales)
                        }
                    } else {
                        switch(chartType) {
                        case .area: AreaChartHorizontaView(dailySales: dailySales)
                        case .bar: BarChartHorizontalView(dailySales: dailySales, barColors: barColors)
                        case .line: LineChartHorizontaView(dailySales: dailySales)
                        }
                    }
                }
                
                if isEditMode {
                    RightChartButtonView(
                        isVerticalMode: $isVerticalChart,
                        titleAlignment: $titleAlignment
                    )
                }
                
            }.padding()
        }
        .padding()
        
    }
    
}

#Preview {
    ChartDemo4()
}
