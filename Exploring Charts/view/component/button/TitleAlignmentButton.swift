import SwiftUI

struct TitleAlignmentButton: View {
    @Binding var titleAlignment: HorizontalAlignment
    
    var body: some View {
        VStack(spacing: 10){
            ForEach(buttonAlignments) { item in
                AlignmentButton(
                    titleAlignment: $titleAlignment,
                    item: item
                )
            }
        }
        .padding(5)
        .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 0.3))
    }
    
}

struct AlignmentButton: View {
    @Binding var titleAlignment: HorizontalAlignment
    
    let item: ButtonAlignmentModel
    
    private let selectedOpacity = 0.7
    private let diselectedOpacity = 0.3
    
    var body: some View {
        Button(
            action: {
                withAnimation {
                    titleAlignment = item.alignment
                }
            },
            label: { Image(systemName: item.imageName) }
        )
        .foregroundStyle(.black)
        .opacity(buttonOpacity(item: item))
    }
    
    private func buttonOpacity(item: ButtonAlignmentModel) -> Double {
        isSelected(item: item) ? selectedOpacity : diselectedOpacity
    }
    
    private func isSelected(item: ButtonAlignmentModel) -> Bool {
        item.alignment == titleAlignment
    }
}

#Preview {
    TitleAlignmentButton(titleAlignment: .constant(.center))
}
