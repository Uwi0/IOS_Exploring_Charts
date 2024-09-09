import SwiftUI

struct LeftChartButtonView: View {
    
    
    @Binding var chartType: ChartType
    @Binding var barColors: [Color]
    @Binding var isVerticalMode: Bool
    private var degrees: Angle {
        .degrees(isVerticalMode ? 0 : 90)
    }
    
    var body: some View {
        VStack {

            
            ForEach(ChartType.allCases, id: \.self) { itemType in
                Button(action: {
                    chartType = itemType
                }, label: {
                    Text(itemType.rawValue)
                })
                .rotationEffect(degrees)
                if itemType != ChartType.allCases.last {
                    Spacer()
                }
            }
            Spacer()
            ColorfulButtonView(
                colors: $barColors,
                dim: 30,
                offset: 10,
                action: {
                    withAnimation {
//                            rotateBar.toggle()
                    }
                })
            
        }
        .padding()
    }
}

#Preview {
    HStack {
        LeftChartButtonView(
            chartType: .constant(.bar),
            barColors: .constant(defaultBarColors), 
            isVerticalMode: .constant(true)
        )
        Spacer()
    }
}
