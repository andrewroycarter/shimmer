import SwiftUI

@available(iOS 15.0, *)
public struct Shimmer: ViewModifier {
    
    public func body(content: Content) -> some View {
        content.mask {
            ShimmerOverlayContainerView()
        }
    }
    
}

@available(iOS 15.0, *)
extension View {
    
    public func shimmers() -> some View {
        self.modifier(Shimmer())
    }
    
}
