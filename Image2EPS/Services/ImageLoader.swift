import AppKit

struct ImageLoader {
    static func rgbData(from cgImage: CGImage) throws -> Data {
        let width = cgImage.width
        let height = cgImage.height
        let bytesPerRow = width * 4
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        var rawData = Data(count: Int(bytesPerRow * height))
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        rawData.withUnsafeMutableBytes { ptr in
            if let context = CGContext(data: ptr.baseAddress, width: width, height: height, bitsPerComponent: 8, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo.rawValue) {
                context.draw(cgImage, in: CGRect(x: 0, y: 0, width: CGFloat(width), height: CGFloat(height)))
            }
        }
        var rgb = Data(capacity: width * height * 3)
        for i in stride(from: 0, to: rawData.count, by: 4) {
            rgb.append(rawData[i])
            rgb.append(rawData[i+1])
            rgb.append(rawData[i+2])
        }
        return rgb
    }
}
