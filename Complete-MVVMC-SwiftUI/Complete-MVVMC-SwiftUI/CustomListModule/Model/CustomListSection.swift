struct CustomListSection: Identifiable {
    let name: String
    let items: [CustomListItem]
    var id: String {
        return name
    }
}
