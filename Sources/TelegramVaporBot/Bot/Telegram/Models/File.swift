
/// This object represents a file ready to be downloaded. The file can be downloaded via the link https://api.telegram.org/file/bot<token>/<file\_path>. It is guaranteed that the link will be valid for at least 1 hour. When the link expires, a new one can be requested by calling getFile.
/// The maximum file size to download is 20 MB
///
/// SeeAlso Telegram Bot API Reference:
/// [File](https://core.telegram.org/bots/api#file)
public final class File: Codable {
    /// Custom keys for coding/decoding `File` struct
    public enum CodingKeys: String, CodingKey {
        case fileID = "file_id"
        case fileUniqueID = "file_unique_id"
        case fileSize = "file_size"
        case filePath = "file_path"
    }

    /// Identifier for this file, which can be used to download or reuse the file
    public var fileID: String

    /// Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file.
    public var fileUniqueID: String

    /// Optional. File size in bytes. It can be bigger than 2^31 and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this value.
    public var fileSize: Int?

    /// Optional. File path. Use https://api.telegram.org/file/bot<token>/<file\_path> to get the file.
    public var filePath: String?

    public init(fileID: String, fileUniqueID: String, fileSize: Int? = nil, filePath: String? = nil) {
        self.fileID = fileID
        self.fileUniqueID = fileUniqueID
        self.fileSize = fileSize
        self.filePath = filePath
    }
}
