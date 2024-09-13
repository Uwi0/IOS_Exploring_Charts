import SwiftUI

struct ButtonMenuDemo4View: View {
    
    @Binding var chartItem: ChartItemModel
    private var editModeIcon: String {
        chartItem.editMode ? "checkmark" : "square.and.pencil"
    }
    
    var body: some View {
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
    }
}

#Preview {
    ButtonMenuDemo4View(chartItem: .constant(.defaultChartItem))
}
