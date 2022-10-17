
/// Represents an issue with the front side of a document. The error is considered resolved when the file with the front side of the document changes.
///
/// SeeAlso Telegram Bot API Reference:
/// [PassportElementErrorFrontSide](https://core.telegram.org/bots/api#passportelementerrorfrontside)
public final class PassportElementErrorFrontSide: Codable {
    /// Custom keys for coding/decoding `PassportElementErrorFrontSide` struct
    public enum CodingKeys: String, CodingKey {
        case source
        case type
        case fileHash = "file_hash"
        case message
    }

    /// Error source, must be front\_side
    public var source: String

    /// The section of the user's Telegram Passport which has the issue, one of “passport”, “driver\_license”, “identity\_card”, “internal\_passport”
    public var type: String

    /// Base64-encoded hash of the file with the front side of the document
    public var fileHash: String

    /// Error message
    public var message: String

    public init(source: String, type: String, fileHash: String, message: String) {
        self.source = source
        self.type = type
        self.fileHash = fileHash
        self.message = message
    }
}
