//
//  ArcView.swift
//  Exploring Charts
//
//  Created by dwi prasetyo on 08/09/24.
//

import SwiftUI

struct ArcView: View {
    
    let color: Color
    let startRadius: CGFloat
    let endRadius: CGFloat
    let startTim: CGFloat
    let endTrim: CGFloat
    let rotate: CGFloat
    
    @State private var finalTrim: CGFloat = 0
    
    private var lineWidth: CGFloat {
        endRadius - startRadius
    }
    
    private var finalRadius: CGFloat {
        endRadius - lineWidth
    }
    
    var body: some View {
        Circle()
            .trim(from: startTim, to: endTrim)
            .stroke(color, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
            .rotationEffect(.degrees(rotate))
            .frame(width: finalRadius, height: finalRadius)
            .onAppear {
                withAnimation {
                    finalTrim = endTrim
                }
            }
    }
}

#Preview {
    ZStack {
        ArcView(
            color: .darkOrchid,
            startRadius: 90,
            endRadius: 100,
            startTim: 0.25,
            endTrim: 0.75,
            rotate: 30
        )
        
        Circle()
            .stroke()
            .frame(width: 100, height: 100)
    }
}
