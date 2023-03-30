import Foundation

class CustomToggleModel: ObservableObject {
    
    @Published var booleanValue: Bool {
        didSet {
            setNewValue(booleanValue)
        }
    }
    
    var setNewValue: (Bool) -> ()
    
    init(booleanValue: Bool, setNewValue: @escaping (Bool) -> ()) {
        self.booleanValue = booleanValue
        self.setNewValue = setNewValue
    }
}
