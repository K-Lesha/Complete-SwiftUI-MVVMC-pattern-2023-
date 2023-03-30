import SwiftUI

struct DetailedValueView: View {
    
    @ObservedObject var viewModel: DetailedValueViewModel
    
    init(viewModel: DetailedValueViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            headerView()
        }
        .navigationBarTitle(viewModel.itemName)
        Spacer()
        HStack {
            DetailedViewButton(viewModel: viewModel, type: .deletion)
            DetailedViewButton(viewModel: viewModel, type: .edition)
        }
        .padding()
    }
    
    private func headerView() -> some View {
        VStack (alignment: .leading, spacing: 10) {
            Text("Key:")
                .bold()
            Text(viewModel.itemKey)
                .font(.subheadline)
            HStack (alignment: .top) {
                Text("Value:")
                    .bold()
                textfiledOrLabel()
                Spacer()
            }
        }
        .padding()
    }
    
    private func textfiledOrLabel() -> some View {
        VStack {
            if viewModel.isShowingTextField {
                TextField("value", text: $viewModel.itemValue, axis: .vertical)
                    .font(.subheadline)
                    .textFieldStyle(.roundedBorder)
                    .foregroundColor(.black)
            } else {
                Text(viewModel.itemValue)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}
