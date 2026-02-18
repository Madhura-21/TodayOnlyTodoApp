import SwiftUI

struct TaskRowView: View {

    let task: TodoTaskEntity
    let onToggle: () -> Void

    var body: some View {

        VStack(alignment: .leading, spacing: 4) {

            HStack {

                Image(systemName:
                        task.isCompleted
                        ? "checkmark.circle.fill"
                        : "circle"
                )
                .onTapGesture { onToggle() }

                Text(task.title ?? "")
                    .strikethrough(task.isCompleted)

                Spacer()
            }

            // Expiry Time Left 
            if let expiry = task.expirationDate {

                Text(expiry.timeRemainingString())
                    .font(.caption)
                    .foregroundColor(
                        expiry < Date() ? .red : .secondary
                    )
            }
        }
        .padding(.vertical, 4)
    }
}

