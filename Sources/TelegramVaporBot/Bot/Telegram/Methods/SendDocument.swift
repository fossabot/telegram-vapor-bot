import Vapor

/// Parameters container struct for `sendDocument` method
public struct SendDocumentParams: Encodable {
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatID: ChatID

    /// File to send. Pass a file\_id as String to send a file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart/form-data. More information on Sending Files »
    public var document: FileInfo

    /// Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file\_attach\_name>” if the thumbnail was uploaded using multipart/form-data under <file\_attach\_name>. More information on Sending Files »
    public var thumb: FileInfo?

    /// Document caption (may also be used when resending documents by file\_id), 0-1024 characters after entities parsing
    public var caption: String?

    /// Mode for parsing entities in the document caption. See formatting options for more details.
    public var parseMode: ParseMode?

    /// A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parse\_mode
    public var captionEntities: [MessageEntity]?

    /// Disables automatic server-side content type detection for files uploaded using multipart/form-data
    public var disableContentTypeDetection: Bool?

    /// Sends the message silently. Users will receive a notification with no sound.
    public var disableNotification: Bool?

    /// Protects the contents of the sent message from forwarding and saving
    public var protectContent: Bool?

    /// If the message is a reply, ID of the original message
    public var replyToMessageID: Int?

    /// Pass True if the message should be sent even if the specified replied-to message is not found
    public var allowSendingWithoutReply: Bool?

    /// Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    public var replyMarkup: ReplyMarkup?

    /// Custom keys for coding/decoding `SendDocumentParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
        case document
        case thumb
        case caption
        case parseMode = "parse_mode"
        case captionEntities = "caption_entities"
        case disableContentTypeDetection = "disable_content_type_detection"
        case disableNotification = "disable_notification"
        case protectContent = "protect_content"
        case replyToMessageID = "reply_to_message_id"
        case allowSendingWithoutReply = "allow_sending_without_reply"
        case replyMarkup = "reply_markup"
    }

    public init(
        chatID: ChatID,
        document: FileInfo,
        thumb: FileInfo? = nil,
        caption: String? = nil,
        parseMode: ParseMode? = nil,
        captionEntities: [MessageEntity]? = nil,
        disableContentTypeDetection: Bool? = nil,
        disableNotification: Bool? = nil,
        protectContent: Bool? = nil,
        replyToMessageID: Int? = nil,
        allowSendingWithoutReply: Bool? = nil,
        replyMarkup: ReplyMarkup? = nil
    ) {
        self.chatID = chatID
        self.document = document
        self.thumb = thumb
        self.caption = caption
        self.parseMode = parseMode
        self.captionEntities = captionEntities
        self.disableContentTypeDetection = disableContentTypeDetection
        self.disableNotification = disableNotification
        self.protectContent = protectContent
        self.replyToMessageID = replyToMessageID
        self.allowSendingWithoutReply = allowSendingWithoutReply
        self.replyMarkup = replyMarkup
    }
}

public extension Bot {
    /// Use this method to send general files. On success, the sent Message is returned. Bots can currently send files of any type of up to 50 MB in size, this limit may be changed in the future.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [SendDocumentParams](https://core.telegram.org/bots/api#senddocument)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `SendDocumentParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `Message` type
    @discardableResult func sendDocument(params: SendDocumentParams) throws -> EventLoopFuture<Message> {
        let methodURL: URI = .init(string: getMethodURL("sendDocument"))
        let future: EventLoopFuture<Message> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
