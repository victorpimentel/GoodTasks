import SwiftUI

struct CheckBox: View {
    @Binding var isChecked: Bool

    var body: some View {
        Button {
            isChecked.toggle()
        } label: {
            Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                .foregroundColor(isChecked ? .green : .secondary)
        }
        .buttonStyle(.plain)
    }
}
