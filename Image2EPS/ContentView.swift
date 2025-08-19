import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    @EnvironmentObject var viewModel: ConversionViewModel

    var body: some View {
        HSplitView {
            ChatPasteView()
                .environmentObject(viewModel)
            VStack(alignment: .leading, spacing: 12) {
                Button("Upload Images") {
                    viewModel.openFiles()
                }
                Button("Choose Output Folder") {
                    viewModel.chooseOutputFolder()
                }
                Button("Convert to EPS") {
                    viewModel.convert()
                }
                Button("Clear List") {
                    viewModel.clear()
                }
                Picker("DPI", selection: $viewModel.dpi) {
                    ForEach([72.0, 96.0, 150.0, 300.0], id: .self) { v in
                        Text("\(Int(v))").tag(v)
                    }
                }
                ProgressView(value: viewModel.progress)
                Text("Items: \(viewModel.items.count)")
                if let folder = viewModel.outputFolder?.path {
                    Text("Output: \(folder)")
                }
                Button("Open Folder") {
                    viewModel.openOutputFolder()
                }.disabled(viewModel.outputFolder == nil)
                Spacer()
            }
            .padding()
        }
        .frame(minWidth: 800, minHeight: 500)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ConversionViewModel())
    }
}
