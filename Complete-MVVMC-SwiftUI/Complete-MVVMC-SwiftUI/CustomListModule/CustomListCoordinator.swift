import Foundation
import SwiftUI

enum CustomListDestinationLink: Hashable, Identifiable {
    case simpleScreen
    case listedValuesView
    case valueView
        
    var id: String {
        return String(self.hashValue)
    }
}

final class CustomListCoordinator: ObservableObject, Identifiable {
    
    @Published var viewModel: CustomListViewModel!
    @Published var activeLink: CustomListDestinationLink?
    private unowned let parent: CustomTabViewCoordinator
    
    init(parent: CustomTabViewCoordinator) {
        self.parent = parent
        self.viewModel = .init(title: "Custom List",
                               coordinator: self)
    }
    
    func set(_ link: CustomListDestinationLink) {
        self.activeLink = link
    }
    
    func createView(for link: CustomListDestinationLink) -> some View {
        ZStack {
            switch link {
            case .simpleScreen:
                showUIKitScreen()
            case .listedValuesView:
                showListedValuesScreen()
            case .valueView:
                showSomeValueScreen()
            }
        }
    }
    
    private func showUIKitScreen() -> some View {
        ZStack {
            let uiViewController = UIViewController()
            GenericUIViewControllerRepresentable(viewController: uiViewController)
                .navigationBarTitle("Empty UIKit screen")
        }
        .statusBarHidden()
    }
    
    private func showListedValuesScreen() -> some View {
        ZStack {
            let coordinator = ListedValuesCoordinator(parent: self)
            let viewModel = ListedValuesViewModel(coordinator: coordinator)
            ListedValuesView(viewModel: viewModel)
        }
    }
    
    private func showSomeValueScreen() -> some View {
        let viewModel = SomeValueViewModel(title: "json placeholder value")
        let view = SomeValueView(viewModel: viewModel)
        
        if let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") {
            let session = URLSession.shared
            let task = session.dataTask(with: url, completionHandler: { data, response, error in
                if let error = error {
                    viewModel.value = "Error: \(error)"
                } else if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        if let data = data, let text = String(data: data, encoding: .utf8) {
                            viewModel.value = text
                        }
                    } else {
                        viewModel.value = "HTTP response code: \(httpResponse.statusCode)"
                    }
                }
            })
            task.resume()
        }
        return view
    }    
}
