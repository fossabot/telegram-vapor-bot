
/// This object represents a service message about a voice chat scheduled in the chat.
///
/// SeeAlso Telegram Bot API Reference:
/// [VoiceChatScheduled](https://core.telegram.org/bots/api#voicechatscheduled)
public final class VoiceChatScheduled: Codable {
    /// Custom keys for coding/decoding `VoiceChatScheduled` struct
    public enum CodingKeys: String, CodingKey {
        case startDate = "start_date"
    }

    /// Point in time (Unix timestamp) when the voice chat is supposed to be started by a chat administrator
    public var startDate: Int

    public init(startDate: Int) {
        self.startDate = startDate
    }
}
