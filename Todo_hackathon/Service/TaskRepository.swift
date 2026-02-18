import CoreData

final class TaskRepository {

    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func fetchAll() throws -> [TodoTaskEntity] {

        let request = TodoTaskEntity.fetchRequest()

        request.sortDescriptors = [
            NSSortDescriptor(key: "createdDate", ascending: false)
        ]

        return try context.fetch(request)
    }

    func insert(title: String,
                 createdDate: Date,
                 expirationDate: Date?) {

         let task = TodoTaskEntity(context: context)

         task.id = UUID()
         task.title = title
         task.createdDate = createdDate
         task.expirationDate = expirationDate
         task.isCompleted = false

         save()
     }


    func toggle(_ task: TodoTaskEntity) {
        task.isCompleted.toggle()
        save()
    }

    func save() {
        try? context.save()
    }
}
