import Vapor

/// Parameters container struct for `sendVenue` method
public struct SendVenueParams: Encodable {
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatID: ChatID

    /// Latitude of the venue
    public var latitude: Float

    /// Longitude of the venue
    public var longitude: Float

    /// Name of the venue
    public var title: String

    /// Address of the venue
    public var address: String

    /// Foursquare identifier of the venue
    public var foursquareID: String?

    /// Foursquare type of the venue, if known. (For example, “arts\_entertainment/default”, “arts\_entertainment/aquarium” or “food/icecream”.)
    public var foursquareType: String?

    /// Google Places identifier of the venue
    public var googlePlaceID: String?

    /// Google Places type of the venue. (See supported types.)
    public var googlePlaceType: String?

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

    /// Custom keys for coding/decoding `SendVenueParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
        case latitude
        case longitude
        case title
        case address
        case foursquareID = "foursquare_id"
        case foursquareType = "foursquare_type"
        case googlePlaceID = "google_place_id"
        case googlePlaceType = "google_place_type"
        case disableNotification = "disable_notification"
        case protectContent = "protect_content"
        case replyToMessageID = "reply_to_message_id"
        case allowSendingWithoutReply = "allow_sending_without_reply"
        case replyMarkup = "reply_markup"
    }

    public init(
        chatID: ChatID,
        latitude: Float,
        longitude: Float,
        title: String,
        address: String,
        foursquareID: String? = nil,
        foursquareType: String? = nil,
        googlePlaceID: String? = nil,
        googlePlaceType: String? = nil,
        disableNotification: Bool? = nil,
        protectContent: Bool? = nil,
        replyToMessageID: Int? = nil,
        allowSendingWithoutReply: Bool? = nil,
        replyMarkup: ReplyMarkup? = nil
    ) {
        self.chatID = chatID
        self.latitude = latitude
        self.longitude = longitude
        self.title = title
        self.address = address
        self.foursquareID = foursquareID
        self.foursquareType = foursquareType
        self.googlePlaceID = googlePlaceID
        self.googlePlaceType = googlePlaceType
        self.disableNotification = disableNotification
        self.protectContent = protectContent
        self.replyToMessageID = replyToMessageID
        self.allowSendingWithoutReply = allowSendingWithoutReply
        self.replyMarkup = replyMarkup
    }
}

public extension Bot {
    /// Use this method to send information about a venue. On success, the sent Message is returned.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [SendVenueParams](https://core.telegram.org/bots/api#sendvenue)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `SendVenueParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `Message` type
    @discardableResult func sendVenue(params: SendVenueParams) throws -> EventLoopFuture<Message> {
        let methodURL: URI = .init(string: getMethodURL("sendVenue"))
        let future: EventLoopFuture<Message> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
