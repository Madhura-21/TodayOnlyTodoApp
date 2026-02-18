import SwiftUI
import UserNotifications

@main
struct TodayOnlyTodoApp: App {

    let coreDataStack = CoreDataStack.shared

    init() {
        UNUserNotificationCenter.current().delegate =
                    NotificationDelegate.shared
        
        NotificationManager.shared.requestPermission()
    }

    var body: some Scene {
        WindowGroup {
            AppContainer()
                .environment(\.managedObjectContext,
                             coreDataStack.context)
        }
    }
}
