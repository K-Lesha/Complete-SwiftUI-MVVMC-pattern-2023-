import Foundation
import SwiftUI

final class CustomListItemsFactory {
    
    @ObservedObject var viewModel: CustomListItemsFactoryModel
    
    init(viewModel: CustomListItemsFactoryModel) {
        self.viewModel = viewModel
    }
    
    func createBooleanItem() -> CustomListItem {
        return CustomListItem(name: "Some boolean value",
                             imageName: "scribble",
                             destination: nil,
                              accessory: .toggle(viewModel.isSomethingModel))
    }
    
    func createFirstNavigationItem() -> CustomListItem {
        return CustomListItem(name: "Navigate to simple screen",
                             imageName: "list.bullet.rectangle.portrait",
                              destination: .simpleScreen,
                             accessory: nil)
    }
    
    func createSecondNavigationItem() -> CustomListItem {
        CustomListItem(name: "Navigate to listed values screen",
                      imageName: "list.star",
                      destination: .listedValuesView,
                      accessory: nil)
    }
    
    func createThirdNavigationItem() -> CustomListItem {
        return CustomListItem(name: "Navigate to some value screen",
                             imageName: "info.circle",
                            destination: .valueView,
                             accessory: nil)
    }
    
    func createFailureDeletionItem() -> CustomListItem {
        return CustomListItem(name: "Failure deletion",
                             imageName: "exclamationmark.lock",
                             destination: nil,
                              accessory: .deletion(viewModel.failureDeletion))
    }
    
    func createSuccesfullyDeletionItem() -> CustomListItem {
        let deletionHandler: handlerWithUIResponse = { uiFeedback in
            self.viewModel.successfullDeletion()
            uiFeedback(.success(""))
        }
        
        return CustomListItem(name: "Successfull deletion",
                             imageName: "lock.open",
                             destination: nil,
                             accessory: .deletion(deletionHandler))
        
    }
    
    func createStateItem() -> CustomListItem {
        return CustomListItem(name: "Some state",
                              imageName: "infinity",
                              destination: nil,
                              accessory: .text(Text("50%"))
        )
    }
    
    func createActivityItem() -> CustomListItem {
        return CustomListItem(name: "Share it",
                             imageName: "sun.max",
                             destination: nil,
                             accessory: .sharing("you are the awesome person"))
    }
}
