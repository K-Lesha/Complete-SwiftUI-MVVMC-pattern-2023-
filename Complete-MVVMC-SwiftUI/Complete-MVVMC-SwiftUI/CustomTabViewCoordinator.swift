import Foundation
import SwiftUI

final class CustomTabViewCoordinator: ObservableObject {
    
    @Published var tab = CustomViewTab.segment
    @Published var segmentCoordinator: SegmentCoordinator!
    @Published var listCoordinator: CustomListCoordinator!
    
    init() {
        self.segmentCoordinator = .init(parent: self)
                
        self.listCoordinator = .init(parent: self)
    }
    
    func createSegmenView() -> some View {
        SegmentView(coordinator: segmentCoordinator)
    }
    
    func createSimpleView() -> some View {
        SimpleView(title: "Simple view",
                   parent: self)
    }
    
    func createCustomListView() -> some View {
        NavigationView {
            CustomList(viewModel: listCoordinator.viewModel)
        }
    }
}
