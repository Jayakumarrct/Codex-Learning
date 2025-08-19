import SwiftUI
import AppKit

class ConversionViewModel: ObservableObject {
    @Published var items: [IntakeItem] = []
    @Published var outputFolder: URL?
    @Published var progress: Double = 0
    @Published var dpi: Double = 72.0

    private let bookmarkStore = BookmarkStore()

    init() {
        outputFolder = bookmarkStore.resolve()
    }

    func openFiles() {
        let panel = NSOpenPanel()
        panel.allowsMultipleSelection = true
        panel.allowedContentTypes = UTType.allowedImages
        if panel.runModal() == .OK {
            for url in panel.urls {
                if let image = NSImage(contentsOf: url) {
                    let item = IntakeItem(name: url.lastPathComponent, image: image, source: .file)
                    items.append(item)
                }
            }
        }
    }

    func chooseOutputFolder() {
        let panel = NSOpenPanel()
        panel.canChooseDirectories = true
        panel.canCreateDirectories = true
        panel.canChooseFiles = false
        if panel.runModal() == .OK {
            outputFolder = panel.url
            if let url = panel.url {
                try? bookmarkStore.save(url: url)
            }
        }
    }

    func clear() {
        items.removeAll()
        progress = 0
    }

    func openOutputFolder() {
        if let url = outputFolder {
            NSWorkspace.shared.activateFileViewerSelecting([url])
        }
    }

    func addPasteImage(_ image: NSImage, name: String) {
        let item = IntakeItem(name: name, image: image, source: .paste)
        items.append(item)
    }

    func convert() {
        guard let folder = outputFolder else {
            showAlert(text: "No output folder set")
            return
        }
        if items.isEmpty {
            showAlert(text: "No files to convert")
            return
        }
        progress = 0
        for (index, item) in items.enumerated() {
            let nameBase = (item.name as NSString).deletingPathExtension
            var outURL = folder.appendingPathComponent("\(nameBase).eps")
            var count = 1
            while FileManager.default.fileExists(atPath: outURL.path) {
                outURL = folder.appendingPathComponent("\(nameBase)-\(count).eps")
                count += 1
            }
            do {
                try EPSWriter.write(image: item.image, to: outURL, dpi: dpi)
                items[index].status = "Done"
            } catch {
                items[index].status = "Failed"
            }
            progress = Double(index + 1) / Double(items.count)
        }
    }

    private func showAlert(text: String) {
        let alert = NSAlert()
        alert.messageText = text
        alert.runModal()
    }
}
