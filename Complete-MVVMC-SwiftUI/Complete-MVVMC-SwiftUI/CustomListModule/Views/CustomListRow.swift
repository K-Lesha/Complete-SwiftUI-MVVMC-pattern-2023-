import SwiftUI

struct CustomListRow: View {
    
    @State var item: CustomListItem
    
    var body: some View {
        HStack {
            Image(systemName: item.imageName)
            Text(item.name)
            Spacer()
            if let accessory = item.accessory {
                CustomListRowAccessory(accessory)
            }
        }
        .contentShape(Rectangle())
    }
}
