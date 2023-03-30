import SwiftUI

enum SegmentType: String, CaseIterable, Identifiable {
    case first = "First"
    case second = "Second"
    var id: String { self.rawValue }
}

struct SegmentView: View {
    
    @ObservedObject var coordinator: SegmentCoordinator
    
    @State var segment = SegmentType.first
    
    var body: some View {
        NavigationView {
            VStack {
                HStack (alignment: .center) {
                    Text("Segments")
                        .font(.largeTitle)
                        .bold()
                    showPicker()
                }
                .padding()
                Spacer()
                showChoosedSegmentView()
                Spacer()
            }
        }
    }
    
    private func showPicker() -> some View {
        Picker("", selection: $segment) {
            ForEach(SegmentType.allCases, id: \.self) { segment in
                Text(segment.rawValue).tag(segment)
            }
        }
        .pickerStyle(.segmented)
        .padding()
    }
    
    private func showChoosedSegmentView() -> some View {
        ZStack {
            if segment == .first {
                coordinator.firstSegment()
            } else if segment == .second {
                coordinator.secondSegment()
            }
        }
    }
}
