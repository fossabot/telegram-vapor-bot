

/**
 This object represents a game. Use BotFather to create and edit games, their short names will act as unique identifiers.

 SeeAlso Telegram Bot API Reference:
 [Game](https://core.telegram.org/bots/api#game)
 */
public final class Game: Codable {
    /// Custom keys for coding/decoding `Game` struct
    public enum CodingKeys: String, CodingKey {
        case title
        case description
        case photo
        case text
        case textEntities = "text_entities"
        case animation
    }

    /// Title of the game
    public var title: String

    /// Description of the game
    public var description: String

    /// Photo that will be displayed in the game message in chats.
    public var photo: [PhotoSize]

    /// Optional. Brief description of the game or high scores included in the game message. Can be automatically edited to include current high scores for the game when the bot calls setGameScore, or manually edited using editMessageText. 0-4096 characters.
    public var text: String?

    /// Optional. Special entities that appear in text, such as usernames, URLs, bot commands, etc.
    public var textEntities: [MessageEntity]?

    /// Optional. Animation that will be displayed in the game message in chats. Upload via BotFather
    public var animation: Animation?

    public init(title: String, description: String, photo: [PhotoSize], text: String? = nil, textEntities: [MessageEntity]? = nil, animation: Animation? = nil) {
        self.title = title
        self.description = description
        self.photo = photo
        self.text = text
        self.textEntities = textEntities
        self.animation = animation
    }
}
