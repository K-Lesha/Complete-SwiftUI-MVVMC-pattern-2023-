import SwiftUI
import UIKit

struct ListedValuesRow: View {
    @ObservedObject var viewModel: DetailedValueViewModel
            
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.itemName)
                Text(viewModel.itemValue)
                    .lineLimit(3)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .contentShape(Rectangle())
    }
}
