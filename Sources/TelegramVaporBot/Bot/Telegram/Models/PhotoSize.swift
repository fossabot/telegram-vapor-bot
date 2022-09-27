

/**
 This object represents one size of a photo or a file / sticker thumbnail.

 SeeAlso Telegram Bot API Reference:
 [PhotoSize](https://core.telegram.org/bots/api#photosize)
 */
public final class PhotoSize: Codable {
    /// Custom keys for coding/decoding `PhotoSize` struct
    public enum CodingKeys: String, CodingKey {
        case fileId = "file_id"
        case fileUniqueId = "file_unique_id"
        case width
        case height
        case fileSize = "file_size"
    }

    /// Identifier for this file, which can be used to download or reuse the file
    public var fileId: String

    /// Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    public var fileUniqueId: String

    /// Photo width
    public var width: Int

    /// Photo height
    public var height: Int

    /// Optional. File size in bytes
    public var fileSize: Int?

    public init(fileId: String, fileUniqueId: String, width: Int, height: Int, fileSize: Int? = nil) {
        self.fileId = fileId
        self.fileUniqueId = fileUniqueId
        self.width = width
        self.height = height
        self.fileSize = fileSize
    }
}
