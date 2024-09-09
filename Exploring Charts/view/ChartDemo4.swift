import SwiftUI
import Charts

struct ChartDemo4: View {
    let dailySales: [DailySalesType]
    @State private var chartType: ChartType = .bar
    @State private var isVerticalChart = true
    @State private var barColors: [Color] = defaultBarColors
    @State var title = "Chart Title"
    @State var titleAlignment: HorizontalAlignment = .trailing
    @State var isEditMode: Bool = false
    
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
                        case .bar: BarChartVerticalView(dailySales: dailySales, barColors: barColors)
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
    ChartDemo4(dailySales: defaultDailySales)
}
