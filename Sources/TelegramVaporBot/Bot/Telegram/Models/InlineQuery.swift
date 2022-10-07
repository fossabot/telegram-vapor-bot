

/**
 This object represents an incoming inline query. When the user sends an empty query, your bot could return some default or trending results.

 SeeAlso Telegram Bot API Reference:
 [InlineQuery](https://core.telegram.org/bots/api#inlinequery)
 */
public final class InlineQuery: Codable {
    /// Custom keys for coding/decoding `InlineQuery` struct
    public enum CodingKeys: String, CodingKey {
        case id
        case from
        case query
        case offset
        case chatType = "chat_type"
        case location
    }

    /// Unique identifier for this query
    public var id: String

    /// Sender
    public var from: User

    /// Text of the query (up to 256 characters)
    public var query: String

    /// Offset of the results to be returned, can be controlled by the bot
    public var offset: String

    /// Optional. Type of the chat from which the inline query was sent. Can be either “sender” for a private chat with the inline query sender, “private”, “group”, “supergroup”, or “channel”. The chat type should be always known for requests sent from official clients and most third-party clients, unless the request was sent from a secret chat
    public var chatType: String?

    /// Optional. Sender location, only for bots that request user location
    public var location: Location?

    public init(id: String, from: User, query: String, offset: String, chatType: String? = nil, location: Location? = nil) {
        self.id = id
        self.from = from
        self.query = query
        self.offset = offset
        self.chatType = chatType
        self.location = location
    }
}