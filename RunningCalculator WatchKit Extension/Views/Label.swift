import SwiftUI

struct Label: View {
    var label: String
    var bold: Bool

    init(_ label: String, bold: Bool = false) {
        self.label = label
        self.bold = bold
    }

    var body: some View {
        Text(label)
            .font(.system(size: 16))
            .fontWeight(bold ? .bold : .regular)
    }
}

struct Label_Previews: PreviewProvider {
    static var previews: some View {
        Label("Hello, World!")
    }
}
