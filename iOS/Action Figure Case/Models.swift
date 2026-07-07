import Foundation

struct Figure: Identifiable, Codable, Equatable {
    var id: UUID = UUID()
    var name: String
    var line: String
    var accessories: String
    var condition: String
    var dateAdded: Date = Date()
}
