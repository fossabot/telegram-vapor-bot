import Foundation

/// There are three ways to send files (photos, stickers, audio, media, etc.):
///
/// If the file is already stored somewhere on the Telegram servers, you don't need to reupload it: each file object has a file\_id field, simply pass this `FileInfo.fileID("file\_id")` as a parameter instead of uploading. There are no limits for files sent this way.
///
/// Provide Telegram with an HTTP URL `FileInfo.url("url")` for the file to be sent. Telegram will download and send the file. 5 MB max size for photos and 20 MB max for other types of content.
///
/// Post the file using multipart/form-data in the usual way that files are uploaded via the browser. 10 MB max size for photos, 50 MB for other files. Use  `FileInfo.url(fileinfo)`
///
/// SeeAlso Telegram Bot API Reference:
/// [Sending Files](https://core.telegram.org/bots/api#sending-files)
public enum FileInfo: Encodable {
    case fileID(String)
    case url(String)
    case file(InputFile)

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .fileID(string):
            try container.encode(string)
        case let .url(string):
            try container.encode(string)
        case let .file(file):
            try container.encode(file)
        }
    }
}