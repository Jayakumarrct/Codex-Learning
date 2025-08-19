import SwiftUI
import UniformTypeIdentifiers

struct DropZoneView: View {
    @EnvironmentObject var viewModel: ConversionViewModel

    var body: some View {
        Rectangle()
            .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [5]))
            .background(Color.clear)
            .onDrop(of: UTType.allowedImages.map { $0.identifier }, isTargeted: nil) { providers in
                for provider in providers {
                    _ = provider.loadObject(ofClass: NSImage.self) { obj, _ in
                        if let image = obj as? NSImage {
                            DispatchQueue.main.async {
                                viewModel.addPasteImage(image, name: "Dropped image")
                            }
                        }
                    }
                }
                return true
            }
    }
}
