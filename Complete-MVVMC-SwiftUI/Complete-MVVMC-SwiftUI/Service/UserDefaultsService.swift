import Foundation

class UserDefaultsService {
    
    init() {
        UserDefaults.standard.set("value 1", forKey: "keytype1.key1")
        UserDefaults.standard.set(true, forKey: "keytype1.key2")
        UserDefaults.standard.set(2023, forKey: "keytype1.key3")
        UserDefaults.standard.set("{closure}", forKey: "keytype2.key1")
        UserDefaults.standard.set("value 2", forKey: "keytype2.key2")
        UserDefaults.standard.set(1885, forKey: "keytype2.key3")
    }
}
