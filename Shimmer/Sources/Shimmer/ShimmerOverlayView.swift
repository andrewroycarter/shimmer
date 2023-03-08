//
//  File.swift
//  
//
//  Created by Andrew Carter on 3/6/23.
//

import Foundation
import SwiftUI

@available(iOS 15.0, *)
struct ShimmerOverlayView: View {
    
    @State private var offset: CGFloat = UIScreen.main.bounds.width * -2.0
    
    public var body: some View {
        GeometryReader { proxy in
            let frame = proxy.frame(in: .global)
            let minX = frame.minX
            let screenWidth = UIScreen.main.bounds.width
            let gradientWidth = 50.0
            Group {
                HStack(spacing: 0) {
                    Color.black
                    LinearGradient(colors: [.black, .black.opacity(0.0), .black],
                                   startPoint: .leading, endPoint: .trailing)
                    .frame(width: gradientWidth)
                    Color.black.frame(width: screenWidth - gradientWidth)
                    Color.black
                }
                .frame(width: screenWidth * 3.0)
                .offset(.init(width: -minX, height: 0.0))
                .offset(.init(width: offset, height: 0.0))
                .animation(.easeInOut(duration: 2.0).repeatForever(autoreverses: false), value: offset)
                .onAppear {
                    offset = 0.0
                }
            }
        }    }
    
}
