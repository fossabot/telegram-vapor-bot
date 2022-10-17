
/// Represents a contact with a phone number. By default, this contact will be sent by the user. Alternatively, you can use input\_message\_content to send a message with the specified content instead of the contact.
///
/// SeeAlso Telegram Bot API Reference:
/// [InlineQueryResultContact](https://core.telegram.org/bots/api#inlinequeryresultcontact)
public final class InlineQueryResultContact: Codable {
    /// Custom keys for coding/decoding `InlineQueryResultContact` struct
    public enum CodingKeys: String, CodingKey {
        case type
        case id
        case phoneNumber = "phone_number"
        case firstName = "first_name"
        case lastName = "last_name"
        case vcard
        case replyMarkup = "reply_markup"
        case inputMessageContent = "input_message_content"
        case thumbURL = "thumb_url"
        case thumbWidth = "thumb_width"
        case thumbHeight = "thumb_height"
    }

    /// Type of the result, must be contact
    public var type: String

    /// Unique identifier for this result, 1-64 Bytes
    public var id: String

    /// Contact's phone number
    public var phoneNumber: String

    /// Contact's first name
    public var firstName: String

    /// Optional. Contact's last name
    public var lastName: String?

    /// Optional. Additional data about the contact in the form of a vCard, 0-2048 bytes
    public var vcard: String?

    /// Optional. Inline keyboard attached to the message
    public var replyMarkup: InlineKeyboardMarkup?

    /// Optional. Content of the message to be sent instead of the contact
    public var inputMessageContent: InputMessageContent?

    /// Optional. URL of the thumbnail for the result
    public var thumbURL: String?

    /// Optional. Thumbnail width
    public var thumbWidth: Int?

    /// Optional. Thumbnail height
    public var thumbHeight: Int?

    public init(
        type: String,
        id: String,
        phoneNumber: String,
        firstName: String,
        lastName: String? = nil,
        vcard: String? = nil,
        replyMarkup: InlineKeyboardMarkup? = nil,
        inputMessageContent: InputMessageContent? = nil,
        thumbURL: String? = nil,
        thumbWidth: Int? = nil,
        thumbHeight: Int? = nil
    ) {
        self.type = type
        self.id = id
        self.phoneNumber = phoneNumber
        self.firstName = firstName
        self.lastName = lastName
        self.vcard = vcard
        self.replyMarkup = replyMarkup
        self.inputMessageContent = inputMessageContent
        self.thumbURL = thumbURL
        self.thumbWidth = thumbWidth
        self.thumbHeight = thumbHeight
    }
}
