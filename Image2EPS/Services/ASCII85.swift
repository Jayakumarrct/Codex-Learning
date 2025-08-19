import Foundation

public struct ASCII85 {
    public static func encode(_ data: Data) -> String {
        var output = ""
        let bytes = [UInt8](data)
        var index = 0
        while index < bytes.count {
            var chunk: UInt32 = 0
            var count = 0
            for i in 0..<4 {
                chunk <<= 8
                if index + i < bytes.count {
                    chunk |= UInt32(bytes[index + i])
                    count += 1
                }
            }
            if count == 4 && chunk == 0 {
                output.append("z")
            } else {
                var encoded = ""
                var value = chunk
                var chars: [Character] = Array(repeating: Character("!"), count: 5)
                for i in (0..<5).reversed() {
                    let digit = Int(value % 85)
                    chars[i] = Character(UnicodeScalar(digit + 33)!)
                    value /= 85
                }
                encoded = String(chars)
                if count < 4 {
                    encoded = String(encoded.prefix(count + 1))
                }
                output.append(encoded)
            }
            index += 4
        }
        output.append("~>")
        return output
    }
}
