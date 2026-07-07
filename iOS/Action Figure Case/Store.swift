import Foundation
import Combine

@MainActor
final class Store: ObservableObject {
    @Published private(set) var items: [Figure] = []
    @Published var isPro: Bool = false

    static let freeLimit = 20

    private let fileURL: URL

    init() {
        let dir = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
        try? FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        fileURL = dir.appendingPathComponent("actionfigurecase_items.json")
        load()
    }

    var canAddMore: Bool {
        isPro || items.count < Store.freeLimit
    }

    func add(_ item: Figure) {
        items.append(item)
        save()
    }

    func update(_ item: Figure) {
        guard let idx = items.firstIndex(where: { $0.id == item.id }) else { return }
        items[idx] = item
        save()
    }

    func delete(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
        save()
    }

    func delete(_ item: Figure) {
        items.removeAll { $0.id == item.id }
        save()
    }

    private func load() {
        if let data = try? Data(contentsOf: fileURL),
           let decoded = try? JSONDecoder().decode([Figure].self, from: data) {
            items = decoded
        } else {
            items = [
        Figure(name: "Spider-Man", line: "Marvel Legends", accessories: "Web shooters, extra hands", condition: "Mint"),
        Figure(name: "Boba Fett", line: "Black Series", accessories: "Blaster, jetpack", condition: "Excellent"),
        Figure(name: "He-Man", line: "Masters of the Universe", accessories: "Sword, shield", condition: "Good"),
        Figure(name: "Iron Man Mk 85", line: "Marvel Legends", accessories: "Repulsor FX", condition: "Mint"),
        Figure(name: "Snake Eyes", line: "G.I. Joe Classified", accessories: "Sword, pistol", condition: "Excellent")
            ]
            save()
        }
    }

    private func save() {
        if let data = try? JSONEncoder().encode(items) {
            try? data.write(to: fileURL, options: .atomic)
        }
    }
}
