import SwiftUI

enum UserDefaultsButtonType: Hashable {
    case deletion
    case edition
}

struct DetailedViewButton: View {
    
     @ObservedObject var viewModel: DetailedValueViewModel
     let type: UserDefaultsButtonType
    
    var body: some View {
        createButton()
    }
    
    private func createButton() -> some View {
        ZStack{
            if type == .deletion {
                createDeletionButton()
            } else {
                createEditButton()
            }
        }
    }
    
    private func createEditButton() -> some View {
        Button {
            withAnimation {
                viewModel.isShowingTextField.toggle()
            }
            viewModel.setNewValue()
        } label: {
            if viewModel.isShowingTextField {
                Text("Save")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.system(size: 18))
                    .padding()
                    .foregroundColor(.white)
            } else if !viewModel.isShowingTextField {
                Text("Edit")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.system(size: 18))
                    .padding()
                    .foregroundColor(.white)
            }
        }
        .background(Color.blue)
        .cornerRadius(10)
    }
    
    private func createDeletionButton() -> some View {
        ZStack {
            if viewModel.itemValue == "nil" {
                EmptyView()
            } else {
                Button {
                    viewModel.deleteKey()
                } label: {
                    Text("Delete")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(.system(size: 18))
                        .padding()
                        .foregroundColor(.white)
                }
                .background(Color.red)
                .cornerRadius(10)
            }
        }
    }
    
}
