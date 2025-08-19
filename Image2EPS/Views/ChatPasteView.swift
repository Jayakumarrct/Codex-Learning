import SwiftUI
import AppKit

struct ChatPasteView: NSViewRepresentable {
    @EnvironmentObject var viewModel: ConversionViewModel

    func makeNSView(context: Context) -> NSTextView {
        let textView = NSTextView()
        textView.isEditable = true
        textView.isSelectable = false
        textView.drawsBackground = false
        textView.delegate = context.coordinator
        return textView
    }

    func updateNSView(_ nsView: NSTextView, context: Context) {
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(viewModel: viewModel)
    }

    class Coordinator: NSObject, NSTextViewDelegate {
        let viewModel: ConversionViewModel
        init(viewModel: ConversionViewModel) {
            self.viewModel = viewModel
        }

        func textView(_ textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
            return false
        }

        func textView(_ textView: NSTextView, paste itemProviders: [NSItemProvider]) -> Bool {
            for provider in itemProviders {
                if provider.canLoadObject(ofClass: NSImage.self) {
                    provider.loadObject(ofClass: NSImage.self) { obj, _ in
                        if let image = obj as? NSImage {
                            DispatchQueue.main.async {
                                self.viewModel.addPasteImage(image, name: "Pasted image")
                            }
                        }
                    }
                }
            }
            return true
        }
    }
}
