import SwiftUI

struct ListedValuesView: View {
    var viewModel: ListedValuesViewModel
    
    @State private var searchText = ""
    
    var searchResults: [ListedValueSection] {
        if searchText.isEmpty {
            return viewModel.userDefaultsSections
        } else {
            var searchItems = [DetailedValueViewModel]()
            viewModel.userDefaultsSections.forEach {
                $0.items.forEach {
                    if $0.itemName.lowercased().contains(searchText.lowercased())
                        || $0.itemKey.lowercased().contains(searchText.lowercased()) {
                        searchItems.append($0)
                    }
                }
            }
            return [ListedValueSection(name: "Search results", items: searchItems)]
        }
    }
    
    var body: some View {
        VStack(spacing: 1) {
            createList()
        }
        .background(Color(UIColor.systemGroupedBackground))
        .navigationBarTitle("Listed Values")
    }
    
    private func createList() -> some View {
        ZStack {
            List {
                ForEach(searchResults) { section in
                    SwiftUI.Section(header: Text("\(section.name)")) {
                        ForEach(section.items) { detailsViewModel in
                            createRow(detailsViewModel)
                        }
                    }
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .navigationBarItems(trailing: ListedValueBarButton(viewModel: self.viewModel))
            
        }
    }
    
    private func createRow(_ detailsViewModel: DetailedValueViewModel) -> some View {
        let detailsView = viewModel.createUserDefaultDetailsView(detailsViewModel)
        return NavigationLink(destination: detailsView) {
            ListedValuesRow(viewModel: detailsViewModel)
        }
    }
}
