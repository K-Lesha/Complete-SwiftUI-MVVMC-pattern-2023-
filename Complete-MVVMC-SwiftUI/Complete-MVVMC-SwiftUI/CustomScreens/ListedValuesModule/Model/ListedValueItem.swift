import Foundation

struct ListedValueItem: Identifiable {    
    let name: String
    let key: String
    var id: String {
        return name
    }
}
