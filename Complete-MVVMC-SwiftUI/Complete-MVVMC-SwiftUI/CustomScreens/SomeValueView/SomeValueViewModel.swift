import Foundation
import UIKit

class SomeValueViewModel: ObservableObject {
    @Published var title: String
    @Published var value: String
    
    init(title: String) {
        self.title = title
        self.value = "wait for it"
    }
    
    func copyValue() {
        UIPasteboard.general.string = self.value
    }
}
