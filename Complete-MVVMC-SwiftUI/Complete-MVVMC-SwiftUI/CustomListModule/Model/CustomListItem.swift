struct CustomListItem: Identifiable {
    let name: String
    let imageName: String
    let destination: CustomListDestinationLink?
    let accessory: CustomListRowAccessoryType?
    var id: String {
        return name
    }
}
