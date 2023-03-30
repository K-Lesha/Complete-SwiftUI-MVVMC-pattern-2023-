import Foundation
import SwiftUI

class CustomListItemsFactoryModel: ObservableObject, Identifiable {
    
    private var booleanValue = true
    
    var isSomethingModel: CustomToggleModel {
        CustomToggleModel(booleanValue: booleanValue) {
            self.booleanValue = $0
        }
    }

    func successfullDeletion() {
        URLCache.shared.removeAllCachedResponses()
    }
    
    var failureDeletion: handlerWithUIResponse = { uiCompletion in
        let fileManager = FileManager.default
        let folderPath: String? = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).map(\.path).first
        
        do {
            if let folderPath {
                for path in try fileManager.contentsOfDirectory(atPath: folderPath) {
                    let p = URL(fileURLWithPath: folderPath).appendingPathComponent(path).absoluteString
                    try FileManager.default.removeItem(atPath: p)
                    uiCompletion(.success(""))
                }
            }
        } catch {
            print("Could not delete file at \(folderPath ?? "")")
            uiCompletion(.failure(.error))
        }
    }
}
