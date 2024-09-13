import SwiftUI
import Charts

struct ChartDemo4: View {
    @State private var chartItem: ChartItemModel = .defaultChartItem
    
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
                        case .bar: BarChartVerticalView(chartItem: $chartItem)
                        case .line, .area: LineAreaChartVerticalView(chartItem: $chartItem)
                        }
                    } else {
                        switch(chartItem.charType) {
                        case .bar: BarChartHorizontalView(chartItem: $chartItem)
                        case .line, .area : LineAreaChartHorizontalView(chartItem: $chartItem)
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
