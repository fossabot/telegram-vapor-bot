
/// Represents a link to a voice message stored on the Telegram servers. By default, this voice message will be sent by the user. Alternatively, you can use input\_message\_content to send a message with the specified content instead of the voice message.
///
/// SeeAlso Telegram Bot API Reference:
/// [InlineQueryResultCachedVoice](https://core.telegram.org/bots/api#inlinequeryresultcachedvoice)
public final class InlineQueryResultCachedVoice: Codable {
    /// Custom keys for coding/decoding `InlineQueryResultCachedVoice` struct
    public enum CodingKeys: String, CodingKey {
        case type
        case id
        case voiceFileID = "voice_file_id"
        case title
        case caption
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case replyMarkup = "reply_markup"
        case inputMessageContent = "input_message_content"
    }

    /// Type of the result, must be voice
    public var type: String

    /// Unique identifier for this result, 1-64 bytes
    public var id: String

    /// A valid file identifier for the voice message
    public var voiceFileID: String

    /// Voice message title
    public var title: String

    /// Optional. Caption, 0-1024 characters after entities parsing
    public var caption: String?

    /// Optional. Mode for parsing entities in the voice message caption. See formatting options for more details.
    public var parseMode: String?

    /// Optional. List of special entities that appear in the caption, which can be specified instead of parse\_mode
    public var captionEntities: [MessageEntity]?

    /// Optional. Inline keyboard attached to the message
    public var replyMarkup: InlineKeyboardMarkup?

    /// Optional. Content of the message to be sent instead of the voice message
    public var inputMessageContent: InputMessageContent?

    public init(
        type: String,
        id: String,
        voiceFileID: String,
        title: String,
        caption: String? = nil,
        parseMode: String? = nil,
        captionEntities: [MessageEntity]? = nil,
        replyMarkup: InlineKeyboardMarkup? = nil,
        inputMessageContent: InputMessageContent? = nil
    ) {
        self.type = type
        self.id = id
        self.voiceFileID = voiceFileID
        self.title = title
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.replyMarkup = replyMarkup
        self.inputMessageContent = inputMessageContent
    }
}
