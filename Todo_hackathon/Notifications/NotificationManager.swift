import UserNotifications

final class NotificationManager {

    static let shared = NotificationManager()

    func requestPermission() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]) { _, _ in }
    }

    func scheduleEndOfDayReminder(hasIncompleteTasks: Bool) {

        guard hasIncompleteTasks else { return }

        let content = UNMutableNotificationContent()
        content.title = "Tasks Pending"
        content.body = "You still have tasks left for today."

        let calendar = Calendar.current
        let now = Date()

        guard let triggerDate = calendar.date(
            bySettingHour: 20,
            minute: 0,
            second: 0,
            of: now
        ) else { return }

        if triggerDate <= now { return }

        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: triggerDate.timeIntervalSinceNow,
            repeats: false
        )

        let request = UNNotificationRequest(
            identifier: "endOfDayReminder",
            content: content,
            trigger: trigger
        )

        UNUserNotificationCenter.current().add(request)
    }
    
    func scheduleDemoNotification10Sec() {

        let content = UNMutableNotificationContent()
        content.title = "Demo Reminder"
        content.body = "You still have tasks left for today."

        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: 05,
            repeats: false
        )

        let request = UNNotificationRequest(
            identifier: "demo10SecNotification",
            content: content,
            trigger: trigger
        )

        UNUserNotificationCenter.current().add(request)
    }

}
