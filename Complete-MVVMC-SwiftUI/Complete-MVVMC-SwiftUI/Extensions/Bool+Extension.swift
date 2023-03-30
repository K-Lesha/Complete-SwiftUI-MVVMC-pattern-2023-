import SwiftUI

extension Bool {
    mutating func setFalseWithAnimation() {
        guard self == true else  { return }
        withAnimation {
            self = false
        }
    }
    
    mutating func setTrueWithAnimation() {
        guard self == false else  { return }
        withAnimation {
            self = true
        }
    }
}
