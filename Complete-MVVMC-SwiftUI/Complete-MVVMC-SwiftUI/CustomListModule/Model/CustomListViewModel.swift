import Foundation
import SwiftUI

final class CustomListViewModel: ObservableObject {
    
    @Published var title: String
    
    private unowned let coordinator: CustomListCoordinator
        
    lazy var sections: [CustomListSection] = {
        let booleanSection = CustomListSectionsFactory.createBooleanSection()
        let navigationSection = CustomListSectionsFactory.createNavigationSection()
        let stateSection = CustomListSectionsFactory.createStateSection()
        let deletionSection = CustomListSectionsFactory.createDeletionSection()
        let sharingSection = CustomListSectionsFactory.createSharingSection()
        
        return [booleanSection, navigationSection, stateSection, deletionSection, sharingSection]
    }()
    
    init(title: String,
         coordinator: CustomListCoordinator) {
        self.title = title
        self.coordinator = coordinator
    }
    
    func open(_ destinationType: CustomListDestinationLink) {
        coordinator.set(destinationType)
    }
    
    func createView(for destinationType: CustomListDestinationLink) -> some View {
        coordinator.createView(for: destinationType)
    }
}
