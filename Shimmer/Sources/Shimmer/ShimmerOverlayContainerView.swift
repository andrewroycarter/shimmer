//
//  File.swift
//  
//
//  Created by Andrew Carter on 3/6/23.
//

import SwiftUI

@available(iOS 15.0, *)
struct ShimmerOverlayContainerView: View {
    
    @Environment(\.redactionReasons) var redactionReasons
    
    @State private var viewId = UUID()
    
    var shouldShimmer: Bool {
        redactionReasons.contains(.placeholder)
    }
    
    public var body: some View {
        Group {
            if shouldShimmer {
                ShimmerOverlayView()
                    .id(viewId)
            } else {
                Color.black
            }
        }.onReceive(
            NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        ) { _ in
            viewId = UUID()
        }
    }
    
}
