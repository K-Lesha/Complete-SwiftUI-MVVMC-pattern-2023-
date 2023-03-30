import Foundation

struct ListedValueSection: Identifiable {
    let name: String
    var items: [DetailedValueViewModel]
    var id: String {
        return name
    }
}
