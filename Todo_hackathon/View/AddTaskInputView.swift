import SwiftUI

struct AddTaskInputView: View {

    @Binding var text: String
    @Binding var hasExpiry: Bool
    @Binding var expiryTime: Date
    let onAdd: () -> Void

    var body: some View {

        VStack(spacing: 10) {

            HStack {
                TextField("Add task", text: $text)
                    .textFieldStyle(.roundedBorder)

                Button("Add") {
                    onAdd()
                }
            }

            Toggle("Set Expiration Time", isOn: $hasExpiry)

            if hasExpiry {
                DatePicker(
                    "Expires",
                    selection: $expiryTime,
                    displayedComponents: .hourAndMinute
                )
            }
        }
        .padding()
    }
}
