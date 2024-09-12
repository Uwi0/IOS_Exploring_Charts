import SwiftUI
import Charts

struct ChartDemo4: View {
    @State private var chartItem = defaultChartItem
    
    private var editModeIcon: String {
        chartItem.editMode ? "checkmark" : "square.and.pencil"
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(
                    action: {
                        withAnimation {
                            chartItem.editMode.toggle()
                        }
                    },
                    label: {
                        Image(systemName: editModeIcon)
                    }
                )
                if !chartItem.editMode {
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
                
                if chartItem.editMode {
                    LeftChartButtonView(chartItem: $chartItem)
                }
                
                VStack(alignment: chartItem.titleAlignment) {
                    Text(chartItem.title)
                        .font(.headline)
                        .fontWeight(.semibold)
                    if chartItem.isVerticalChart {
                        switch(chartItem.charType) {
                        case .area: AreaChartVerticalView(chartItem: chartItem)
                        case .bar: BarChartVerticalView(chartItem: $chartItem)
                        case .line: LineChartVerticalView(chartItem: chartItem)
                        }
                    } else {
                        switch(chartItem.charType) {
                        case .area: AreaChartHorizontaView(chartItem: chartItem)
                        case .bar: BarChartHorizontalView(chartItem: chartItem)
                        case .line: LineChartHorizontaView(chartItem: chartItem)
                        }
                    }
                }
                
                if chartItem.editMode {
                    RightChartButtonView(chartItem: $chartItem)
                }
                
            }.padding()
        }
        .padding()
        
    }
    
}

#Preview {
    ChartDemo4()
}
