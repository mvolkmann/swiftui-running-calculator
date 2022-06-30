import SwiftUI

// The concrete type of Content can be any type
// that conforms to the View protocol.
struct LogicLink<Content: View>: View {
    let isActive: Binding<Bool>
    let destination: () -> Content

    var body: some View {
        NavigationLink(
            isActive: isActive,
            destination: destination
        ) {
            EmptyView()
                .opacity(0)
                .background(.clear)
                .frame(maxWidth: 0, maxHeight: 0)
        }

    }
}
