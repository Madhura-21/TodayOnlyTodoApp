import Foundation

extension Date {

    func timeRemainingString(from now: Date = Date()) -> String {

        let interval = self.timeIntervalSince(now)

        if interval <= 0 {
            return "Expired"
        }

        let minutes = Int(interval / 60)
        let hours = minutes / 60
        let remainingMinutes = minutes % 60

        if hours > 0 {
            return "Expires in \(hours)h \(remainingMinutes)m"
        } else {
            return "Expires in \(remainingMinutes)m"
        }
    }
}
