import Foundation
import SwiftUI

final class ListedValuesViewModel {
    
    var coordinator: ListedValuesCoordinator

    var userDefaultsSections = [ListedValueSection]()
    
    private var keyMapping: [String: String] = ["keytype1.key1": "Value type 1, name 1",
                                                "keytype1.key2": "Value type 1, name 2",
                                                "keytype1.key3": "Value type 1, name 3",
                                                "keytype2.key1": "Value type 2, name 1",
                                                "keytype2.key2": "Value type 2, name 2",
                                                "keytype2.key3": "Value type 2, name 3",
    ]
    
    init(coordinator: ListedValuesCoordinator) {
        self.coordinator = coordinator
        updateSections()
    }
    
    private func updateSections() {
        self.userDefaultsSections = [ListedValueSection]()
        firstSection()
        secondSection()
    }
    
    private func firstSection() {
        var firstSectionItems: [DetailedValueViewModel] = []
        keyMapping.forEach {
            if $0.key.starts(with: "keytype1.") {
                let name = $0.value
                let key = $0.key
                let gpsConfigItem = ListedValueItem(name: name, key: key)
                firstSectionItems.append(DetailedValueViewModel(item: gpsConfigItem))
            }
        }
        if firstSectionItems.count > 0 {
            firstSectionItems.sort { $0.itemName < $1.itemName }
            userDefaultsSections.append(ListedValueSection(name: "Type 1", items: firstSectionItems))
        }
    }
    
    private func secondSection() {
        var secondSectionItems: [DetailedValueViewModel] = []
        keyMapping.forEach {
            if $0.key.starts(with: "keytype2.") {
                let name = $0.value
                let key = $0.key
                let appUIConfigItem = ListedValueItem(name: name, key: key)
                secondSectionItems.append(DetailedValueViewModel(item: appUIConfigItem))
            }
        }
        if secondSectionItems.count > 0 {
            secondSectionItems.sort { $0.itemName < $1.itemName }
            userDefaultsSections.append(ListedValueSection(name: "Type 2", items: secondSectionItems))
        }
    }
    
    func deleteAllEntries(completion: @escaping () -> ()) {
        if let bundleName = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleName)
            updateItems()
            completion()
        }
    }
    
    func updateItems() {
        userDefaultsSections.forEach { section in
            section.items.forEach { viewModel in
                viewModel.updateItemValue()
            }
        }
    }
    
    func createUserDefaultDetailsView(_ detailsViewModel: DetailedValueViewModel) -> some View {
        coordinator.createDetailsScreen(detailsViewModel)
    }
}
