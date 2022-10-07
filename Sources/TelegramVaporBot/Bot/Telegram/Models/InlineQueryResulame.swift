

/**
 Represents a Game.

 SeeAlso Telegram Bot API Reference:
 [InlineQueryResultGame](https://core.telegram.org/bots/api#inlinequeryresultgame)
 */
public final class InlineQueryResultGame: Codable {
    /// Custom keys for coding/decoding `InlineQueryResultGame` struct
    public enum CodingKeys: String, CodingKey {
        case type
        case id
        case gameShortName = "game_short_name"
        case replyMarkup = "reply_markup"
    }

    /// Type of the result, must be game
    public var type: String

    /// Unique identifier for this result, 1-64 bytes
    public var id: String

    /// Short name of the game
    public var gameShortName: String

    /// Optional. Inline keyboard attached to the message
    public var replyMarkup: InlineKeyboardMarkup?

    public init(type: String, id: String, gameShortName: String, replyMarkup: InlineKeyboardMarkup? = nil) {
        self.type = type
        self.id = id
        self.gameShortName = gameShortName
        self.replyMarkup = replyMarkup
    }
}