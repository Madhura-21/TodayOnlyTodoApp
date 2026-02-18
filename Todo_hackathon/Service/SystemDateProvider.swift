import Foundation

struct SystemDateProvider: DateProviding {

    var now: Date { Date() }

    func isToday(_ date: Date) -> Bool {
        Calendar.current.isDateInToday(date)
    }
}

