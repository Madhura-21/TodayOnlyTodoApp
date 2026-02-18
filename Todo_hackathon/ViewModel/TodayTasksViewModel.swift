import Foundation
import Combine

@MainActor
final class TodayTasksViewModel: ObservableObject {

    @Published private(set) var tasks: [TodoTaskEntity] = []

    private let repository: TaskRepository
    private let dateProvider: DateProviding

    init(repository: TaskRepository,
         dateProvider: DateProviding) {
        self.repository = repository
        self.dateProvider = dateProvider
        loadTasks()
    }

    func loadTasks() {

        do {
            let all = try repository.fetchAll()

            tasks = all.filter { task in

                guard let created = task.createdDate else { return false }

                let isToday = dateProvider.isToday(created)

                if let expiry = task.expirationDate {
                    return isToday && expiry > dateProvider.now
                }

                return isToday
            }

            NotificationManager.shared.scheduleEndOfDayReminder(
                hasIncompleteTasks: tasks.contains { !$0.isCompleted }
            )

        } catch {
            print(error)
        }
    }

    func addTask(title: String,
                 expirationDate: Date?) {

        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return }

        repository.insert(
            title: title,
            createdDate: dateProvider.now,
            expirationDate: expirationDate
        )

        loadTasks()
    }

    func toggleTask(_ task: TodoTaskEntity) {
        repository.toggle(task)
        loadTasks()
    }
}
