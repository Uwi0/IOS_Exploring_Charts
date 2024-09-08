import SwiftUI
import Charts

struct ChartDemo2: View {
    
    let min = 0.0
    let max = 1000.0
    @State var isLegendVisible: Bool = false
    
    var body: some View {
        VStack {
            Text("Welcome to Charts!")
            Chart {
                BarMark(x: .value("Day", "Sun"),y: .value("Sales", 100))
                    .annotation {
                        Image(systemName: "figure.walk.circle.fill")
                            .foregroundStyle(Color.blueViolet)
                            .fontWeight(.bold)
                            .font(.title)
                    }
                    .foregroundStyle(by: .value("Day", "Sun"))
                BarMark(x: .value("Day", "Mon"),y: .value("Sales", 250))
                    .foregroundStyle(by: .value("Days", "Mon"))
                BarMark(x: .value("Day", "Tue"),y: .value("Sales", 75.3))
                    .foregroundStyle(by: .value("Day", "Tue"))
                BarMark(x: .value("Day", "Wed"),y: .value("Sales", 300))
                    .foregroundStyle(by: .value("Day", "Wed"))
                BarMark(x: .value("Day", "Thurs"),y: .value("Sales", 450))
                    .foregroundStyle(by: .value("Day", "Thu"))
                BarMark(x: .value("Day", "Fri"), y: .value("Sales", 20))
                    .foregroundStyle(by: .value("Day", "Fri1"))
                BarMark(x: .value("Day", "Fri"), y: .value("Sales", 400))
                    .foregroundStyle(by: .value("Day", "Fri2"))
                BarMark(x: .value("Day", "Sat"), y: .value("Sales", 320))
                    .foregroundStyle(by: .value("Day", "Sat"))
            }
            .chartYScale(domain: min...max)
            .chartXAxis {
                AxisMarks(position: .top)
            }.chartYAxis {
                AxisMarks(position: .leading)
            }
            .chartLegend(isLegendVisible ? .visible : .hidden)
            .padding()
            
            Button(
                action: {
                    withAnimation {
                        isLegendVisible.toggle()
                    }
                },
                label: {
                    Image(systemName: isLegendVisible ? "eye" : "eye.slash")
                }
            )
            .padding()
        }
        .padding()
    }
}

#Preview {
    ChartDemo2()
}
