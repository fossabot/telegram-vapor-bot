
/// This object represents a service message about new members invited to a voice chat.
///
/// SeeAlso Telegram Bot API Reference:
/// [VoiceChatParticipantsInvited](https://core.telegram.org/bots/api#voicechatparticipantsinvited)
public final class VoiceChatParticipantsInvited: Codable {
    /// Custom keys for coding/decoding `VoiceChatParticipantsInvited` struct
    public enum CodingKeys: String, CodingKey {
        case users
    }

    /// Optional. New members that were invited to the voice chat
    public var users: [User]?

    public init(users: [User]? = nil) {
        self.users = users
    }
}
