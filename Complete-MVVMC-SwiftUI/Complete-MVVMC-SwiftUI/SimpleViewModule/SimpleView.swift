import Foundation
import SwiftUI

struct SimpleView: View {
    
    let title: String
    private unowned let parent: CustomTabViewCoordinator
    
    init(title: String,
         parent: CustomTabViewCoordinator) {
        self.title = title
        self.parent = parent
    }
    
    var body: some View {
        HStack {
            Image(systemName: "bubbles.and.sparkles")
            Text("Some view content")
        }
        .navigationTitle(Text("Simple view"))
    }
}
