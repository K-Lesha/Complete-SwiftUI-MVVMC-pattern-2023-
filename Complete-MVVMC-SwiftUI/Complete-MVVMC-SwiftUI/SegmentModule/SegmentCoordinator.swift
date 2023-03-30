import Foundation
import SwiftUI

final class SegmentCoordinator: ObservableObject, Identifiable {
    
    private unowned let parent: CustomTabViewCoordinator
    
    init(parent: CustomTabViewCoordinator) {
        self.parent = parent
    }
    
    func firstSegment() -> some View {
        Text("First segment view content")
    }
    
    func secondSegment() -> some View {
        Text("Second segment view content")
    }
}
