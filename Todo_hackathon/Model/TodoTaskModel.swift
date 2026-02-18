import Foundation

struct TodoTask: Identifiable {

    let id: UUID
    let title: String
    let isCompleted: Bool
    let createdDate: Date
}

