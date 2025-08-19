import AppKit

public struct EPSWriter {
    public static func write(image: NSImage, to url: URL, dpi: Double) throws {
        guard let cgImage = image.cgImage(forProposedRect: nil, context: nil, hints: nil) else {
            throw NSError(domain: "EPSWriter", code: 1, userInfo: [NSLocalizedDescriptionKey: "Unable to get CGImage"])
        }
        let width = cgImage.width
        let height = cgImage.height
        let data = try ImageLoader.rgbData(from: cgImage)
        let ascii = ASCII85.encode(data)
        let bboxW = Int(round(Double(width) * 72.0 / dpi))
        let bboxH = Int(round(Double(height) * 72.0 / dpi))
        var text = "%!PS-Adobe-3.0 EPSF-3.0\n"
        text += "%%BoundingBox: 0 0 \(bboxW) \(bboxH)\n"
        text += "/picstr {\(width * 3)} string def\n"
        text += "\(bboxW) \(bboxH) scale\n"
        text += "\(width) \(height) 8\n"
        text += "[ \(width) 0 0 -\(height) 0 \(height) ]\n"
        text += "{ currentfile /ASCII85Decode filter picstr readstring pop }\n"
        text += "false 3 colorimage\n"
        text += ascii + "\n"
        try text.write(to: url, atomically: true, encoding: .utf8)
    }
}
