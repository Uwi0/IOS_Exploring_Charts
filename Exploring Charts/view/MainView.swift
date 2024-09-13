import SwiftUI

struct MainView: View {
    @State private var chartItem: ChartItemModel = .defaultChartItem
    @State private var editTitle: Bool = false
    
    private var borderColor: Color {
        .black
        .opacity(chartItem.showBorder ? 1.0 : 0.0)
    }

    var body: some View {
        HStack {
            if chartItem.editMode {
                LeftChartButtonView(chartItem: $chartItem)
            }
            VStack {
                ButtonMenuDemo4View(chartItem: $chartItem)
                    .padding(.top)
                
                VStack(alignment: chartItem.titleAlignment) {
                    if !editTitle {
                        Text(chartItem.title)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .onTapGesture {
                                editTitle.toggle()
                            }
                    } else {
                        TextField(chartItem.title, text: $chartItem.title)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .onSubmit {
                                editTitle.toggle()
                            }
                    }
                    ChartDemo4(chartItem: $chartItem)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20).stroke(borderColor)
                )
            .padding()
            }
            if chartItem.editMode {
                RightChartButtonView(chartItem: $chartItem)
            }
        }
    }
}

#Preview {
    MainView()
}
