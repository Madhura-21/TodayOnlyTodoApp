import Foundation

protocol DateProviding {
    var now: Date { get }
    func isToday(_ date: Date) -> Bool
}
