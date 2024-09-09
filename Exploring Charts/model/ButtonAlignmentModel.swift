
import SwiftUI

struct ButtonAlignmentModel: Identifiable {
    let id = UUID()
    let imageName: String
    let alignment: HorizontalAlignment
}

let buttonAlignments: [ButtonAlignmentModel] = [
    .init(imageName: "align.horizontal.left.fill", alignment: .leading),
    .init(imageName: "align.horizontal.center.fill", alignment: .center),
    .init(imageName: "align.horizontal.right.fill", alignment: .trailing)
]
