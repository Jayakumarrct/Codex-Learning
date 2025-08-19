import SwiftUI

enum IntakeSource: String {
    case file = "File"
    case drag = "Drag"
    case paste = "Paste"
}

struct IntakeItem: Identifiable {
    let id = UUID()
    let name: String
    let image: NSImage
    let source: IntakeSource
    var status: String = "Queued"
}
