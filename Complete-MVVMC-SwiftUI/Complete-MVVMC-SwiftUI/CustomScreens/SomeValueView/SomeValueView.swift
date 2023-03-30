import SwiftUI

struct SomeValueView: View {
    
    @ObservedObject var viewModel: SomeValueViewModel
    
    var valueRow: some View {
        HStack (alignment: .top) {
            Text("Value:")
                .bold()
            Text(viewModel.value)
            Spacer()
        }
        .padding()
    }
    
    var button: some View {
        Button {
            viewModel.copyValue()
        } label: {
            Text("Copy value")
                .frame(minWidth: 0, maxWidth: .infinity)
                .font(.system(size: 18))
                .padding()
                .foregroundColor(.white)
        }
        .background(Color.blue)
        .cornerRadius(10)
        .padding()
    }
    
    var body: some View {
        VStack {
            valueRow
            Spacer()
            button
        }
        .navigationBarTitle(viewModel.title)
    }
}
