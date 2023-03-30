import SwiftUI

struct ListedValueBarButton: View {
    
    var viewModel: ListedValuesViewModel
    
    @State private var showingDeletionConfirmation = false {
        didSet {
            DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                showingDeletionConfirmation.setFalseWithAnimation()
            }
        }
    }
    
    var body: some View {
        Button {
            viewModel.deleteAllEntries() {
                showingDeletionConfirmation.setTrueWithAnimation()
            }
        } label: {
            HStack(spacing: 1) {
                if !showingDeletionConfirmation {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                        .scaleEffect(0.8)
                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
                    Text("Delete all")
                        .font(.subheadline)
                        .foregroundColor(.red)
                } else {
                    Image(systemName: "checkmark.diamond.fill")
                        .foregroundColor(.green)
                        .scaleEffect(0.8)
                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
                    Text("Deleted")
                        .font(.subheadline)
                        .foregroundColor(.green)
                }
            }
        }
    }
}
