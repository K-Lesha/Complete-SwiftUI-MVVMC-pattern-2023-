import SwiftUI

typealias handlerWithUIResponse = ((Result<Any, CustomListError>) -> ()) -> ()

enum CustomListError: Error {
    case error
}

enum CustomListRowAccessoryType {
    case deletion(_ handler: handlerWithUIResponse)
    case sharing(_ shareText: String)
    case toggle(_ viewModel: CustomToggleModel)
    case text(_: Text)
}

struct CustomListRowAccessory: View {
    
    private var type: CustomListRowAccessoryType
    @State private var showingPopView = false
    @State private var showingAlert = false
    @ObservedObject private var toggleModel: CustomToggleModel
    
    @State private var showingDeletionConfirmation = false {
        didSet {
            DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) {
                showingDeletionConfirmation.setFalseWithAnimation()
            }
        }
    }
    
    @State private var showingDeletionFailure = false {
        didSet {
            DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) {
                showingDeletionFailure.setFalseWithAnimation()
            }
        }
    }
    
    init(_ type: CustomListRowAccessoryType) {
        self.type = type
        switch type {
        case .toggle(let toggleModel):
            self.toggleModel = toggleModel
        default:
            self.toggleModel = .init(booleanValue: false,
                                     setNewValue: {_ in })
        }
    }
    
    var body: some View {
        switch type {
        case .deletion(let deletionHandler):
            createDeletionButton(with: deletionHandler)
        case .sharing(let shareText):
            createSharingAccessoryButton(with: shareText)
        case .toggle(_):
            Toggle("", isOn: $toggleModel.booleanValue)
        case .text(let text):
            text
                .foregroundColor(.gray)
        }
    }
    
    private func createDeletionButton(with deletionHandler: @escaping handlerWithUIResponse) -> some View {
        return Button() {
            showingAlert.toggle()
        } label: {
            createDeletionAccessoryLabel()
        }
        .alert(isPresented: $showingAlert) {
            createAlert(with: deletionHandler)
        }
    }
    
    private func createDeletionAccessoryLabel() -> some View {
        if showingDeletionConfirmation {
            return Image(systemName: "checkmark.diamond.fill")
                .foregroundColor(.green)
                .scaleEffect(0.8)
                .transition(.asymmetric(insertion: .scale, removal: .opacity))
        } else if showingDeletionFailure {
            return Image(systemName: "exclamationmark.square")
                .foregroundColor(.red)
                .scaleEffect(0.8)
                .transition(.asymmetric(insertion: .scale, removal: .opacity))
        } else {
            return Image(systemName: "trash")
                .foregroundColor(.gray)
                .scaleEffect(0.8)
                .transition(.asymmetric(insertion: .scale, removal: .opacity))
        }
    }
    
    private func createAlert(with deletionHandler: @escaping handlerWithUIResponse) -> Alert {
        let primaryButton: Alert.Button = .default(Text("Yes")) {
            deletionHandler() { result in
                switch result {
                case .success(_):
                    showingDeletionConfirmation.setTrueWithAnimation()
                case .failure(_):
                    showingDeletionFailure.setTrueWithAnimation()
                }
            }
        }
        
        let secondaryButton: Alert.Button = .destructive(Text("No"))
        
        return Alert(title: Text("Are you sure?"),
                     primaryButton: primaryButton,
                     secondaryButton: secondaryButton)
    }
    
    private func createSharingAccessoryButton(with shareText: String) -> some View {
        return Button() {
            withAnimation {
                showingPopView.toggle()
            }
        } label: {
            return Image(systemName: "square.and.arrow.up")
                .foregroundColor(.gray)
                .scaleEffect(0.8)
                .transition(.asymmetric(insertion: .scale, removal: .opacity))
        }
        .sheet(isPresented: $showingPopView) {
            createActivityView(with: shareText)
        }
    }
    
    private func createActivityView(with shareText: String) -> GenericUIViewControllerRepresentable<UIActivityViewController> {
        let activityView = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
        return GenericUIViewControllerRepresentable(viewController: activityView)
    }
}
