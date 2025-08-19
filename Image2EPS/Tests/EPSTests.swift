import XCTest
@testable import Image2EPS

final class EPSTests: XCTestCase {
    func testASCII85() {
        let data = Data([0, 0, 0, 0])
        let encoded = ASCII85.encode(data)
        XCTAssertEqual(encoded, "z~>")
    }

    func testWriteEPS() throws {
        #if os(macOS)
        let size = NSSize(width: 10, height: 10)
        let image = NSImage(size: size)
        image.lockFocus()
        NSColor.red.setFill()
        NSRect(origin: .zero, size: size).fill()
        image.unlockFocus()
        let url = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("test.eps")
        try EPSWriter.write(image: image, to: url, dpi: 72)
        let content = try String(contentsOf: url)
        XCTAssertTrue(content.contains("%%BoundingBox"))
        #endif
    }
}
