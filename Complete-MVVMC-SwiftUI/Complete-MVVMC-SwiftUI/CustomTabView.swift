import SwiftUI

enum CustomViewTab {
    case segment
    case simpleView
    case list
}

struct CustomTabView: View {
        
    @ObservedObject var coordinator: CustomTabViewCoordinator
        
    var body: some View {
        TabView(selection: $coordinator.tab) {
            
            coordinator.createSegmenView()
                .tabItem {
                    Image(systemName: "square.split.2x1")
                    Text("Segment")
                }
                .tag(CustomViewTab.segment)
            
            coordinator.createSimpleView()
                .navigationViewStyle(StackNavigationViewStyle())
                .tabItem {
                    Image(systemName: "bubbles.and.sparkles")
                    Text("Simple view")
                }
                .tag(CustomViewTab.simpleView)
            
            coordinator.createCustomListView()
                .tabItem {
                    Image(systemName: "list.number.ar")
                    Text("List")
                }
                .tag(CustomViewTab.list)
        }
    }
}
