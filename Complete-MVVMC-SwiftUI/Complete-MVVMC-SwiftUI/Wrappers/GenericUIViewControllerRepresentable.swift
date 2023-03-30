import SwiftUI

struct GenericUIViewControllerRepresentable<UIViewController: UIKit.UIViewController>: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    
    var viewController: UIViewController
    
    func makeUIViewController(context: Context) -> UIViewController {
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Updates the state of the specified view controller with new information from SwiftUI.
    }
}
