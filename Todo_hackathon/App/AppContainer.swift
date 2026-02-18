import SwiftUI
import CoreData

struct AppContainer: View {

    @Environment(\.managedObjectContext) private var context

    var body: some View {

        TodayTasksView(
            viewModel: TodayTasksViewModel(
                repository: TaskRepository(context: context),
                dateProvider: SystemDateProvider()
            )
        )
    }
}

