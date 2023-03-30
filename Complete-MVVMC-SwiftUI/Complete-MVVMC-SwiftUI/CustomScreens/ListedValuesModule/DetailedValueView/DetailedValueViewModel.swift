import Foundation
import SwiftUI

final class DetailedValueViewModel: ObservableObject, Identifiable {
    
    private var item: ListedValueItem
    @Published var isShowingTextField: Bool = false
    
    var itemName: String {
        item.name
    }
    
    var itemKey: String {
        item.key
    }
    
    @Published var itemValue: String
    
    init(item: ListedValueItem) {
        self.item = item
        let itemValue = UserDefaults.standard.object(forKey: item.key)
        self.itemValue = String("\(itemValue ?? "nil")")
    }
    
    func deleteKey() {
        UserDefaults.standard.removeObject(forKey: item.key)
        updateItemValue()
    }
    
    func setNewValue() {
        UserDefaults.standard.set(itemValue, forKey: itemKey)
        updateItemValue()
    }
    
    func updateItemValue() {
        let itemValue = UserDefaults.standard.object(forKey: item.key)
        self.itemValue = String("\(itemValue ?? "nil")")
    }
}
