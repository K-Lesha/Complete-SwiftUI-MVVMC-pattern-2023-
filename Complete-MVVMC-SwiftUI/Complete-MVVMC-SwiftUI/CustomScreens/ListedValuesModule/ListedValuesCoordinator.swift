import Foundation
import SwiftUI

final class ListedValuesCoordinator: ObservableObject, Identifiable {
        
    private unowned var parent: CustomListCoordinator
    
    init(parent: CustomListCoordinator) {
        self.parent = parent
    }
    
    func createDetailsScreen(_ viewModel: DetailedValueViewModel)-> some View {
        DetailedValueView(viewModel: viewModel)
    }
}
