import SwiftUI

struct CustomList: View {
    
    private let viewModel: CustomListViewModel
    
    init(viewModel: CustomListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            ForEach(viewModel.sections) { section in
                SwiftUI.Section(header: Text("\(section.name)")) {
                    ForEach(section.items) { item in
                        createRow(item)
                    }
                }
            }
        }
        .navigationBarTitle(viewModel.title)
    }
    
    private func createRow(_ item: CustomListItem) -> some View {
        ZStack {
            if let destinationType = item.destination {
                NavigationLink(destination: viewModel.createView(for: destinationType)) {
                    CustomListRow(item: item)
                }
            } else {
                CustomListRow(item: item)
            }
        }
    }
}
