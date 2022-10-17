
/// Represents a link to a sticker stored on the Telegram servers. By default, this sticker will be sent by the user. Alternatively, you can use input\_message\_content to send a message with the specified content instead of the sticker.
///
/// SeeAlso Telegram Bot API Reference:
/// [InlineQueryResultCachedSticker](https://core.telegram.org/bots/api#inlinequeryresultcachedsticker)
public final class InlineQueryResultCachedSticker: Codable {
    /// Custom keys for coding/decoding `InlineQueryResultCachedSticker` struct
    public enum CodingKeys: String, CodingKey {
        case type
        case id
        case stickerFileID = "sticker_file_id"
        case replyMarkup = "reply_markup"
        case inputMessageContent = "input_message_content"
    }

    /// Type of the result, must be sticker
    public var type: String

    /// Unique identifier for this result, 1-64 bytes
    public var id: String

    /// A valid file identifier of the sticker
    public var stickerFileID: String

    /// Optional. Inline keyboard attached to the message
    public var replyMarkup: InlineKeyboardMarkup?

    /// Optional. Content of the message to be sent instead of the sticker
    public var inputMessageContent: InputMessageContent?

    public init(
        type: String,
        id: String,
        stickerFileID: String,
        replyMarkup: InlineKeyboardMarkup? = nil,
        inputMessageContent: InputMessageContent? = nil
    ) {
        self.type = type
        self.id = id
        self.stickerFileID = stickerFileID
        self.replyMarkup = replyMarkup
        self.inputMessageContent = inputMessageContent
    }
}
