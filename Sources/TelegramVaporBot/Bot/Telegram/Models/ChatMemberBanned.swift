

/**
 Represents a chat member that was banned in the chat and can't return to the chat or view chat messages.

 SeeAlso Telegram Bot API Reference:
 [ChatMemberBanned](https://core.telegram.org/bots/api#chatmemberbanned)
 */
public final class ChatMemberBanned: Codable {
    /// Custom keys for coding/decoding `ChatMemberBanned` struct
    public enum CodingKeys: String, CodingKey {
        case status
        case user
        case untilDate = "until_date"
    }

    /// The member's status in the chat, always “kicked”
    public var status: String

    /// Information about the user
    public var user: User

    /// Date when restrictions will be lifted for this user; unix time. If 0, then the user is banned forever
    public var untilDate: Int

    public init(status: String, user: User, untilDate: Int) {
        self.status = status
        self.user = user
        self.untilDate = untilDate
    }
}
