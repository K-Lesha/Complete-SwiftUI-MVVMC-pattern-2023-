final class CustomListSectionsFactory {
    
    static var itemsFactory = CustomListItemsFactory(viewModel: .init())
    
    static func createBooleanSection() -> CustomListSection {
        let someBooleanItem = itemsFactory.createBooleanItem()
        
        return CustomListSection(name: "Boolean Section",
                                items: [someBooleanItem])
    }
    
    static func createNavigationSection() -> CustomListSection {
        let firstNavItem = itemsFactory.createFirstNavigationItem()
        let secondNavItem = itemsFactory.createSecondNavigationItem()
        let thirdNavItem = itemsFactory.createThirdNavigationItem()
        
        return CustomListSection(name: "Navigation Section",
                                items: [firstNavItem, secondNavItem, thirdNavItem])
    }
    
    static func createStateSection() -> CustomListSection {
        let stateItem = itemsFactory.createStateItem()
        
        return CustomListSection(name: "State settings",
                                items: [stateItem])
    }
    
    static func createDeletionSection() -> CustomListSection {
        let successfullDeletionItem = itemsFactory.createSuccesfullyDeletionItem()
        let failureDeletionItem = itemsFactory.createFailureDeletionItem()
        
        return CustomListSection(name: "Deletion settings",
                                items: [successfullDeletionItem, failureDeletionItem])
    }
    
    static func createSharingSection() -> CustomListSection {
        let sharingItem = itemsFactory.createActivityItem()
        
        return CustomListSection(name: "Sharing settings",
                                items: [sharingItem])
    }

}
