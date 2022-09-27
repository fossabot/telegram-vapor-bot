import Vapor

/// DESCRIPTION:
/// Use this method to receive incoming updates using long polling (wiki). Returns an Array of Update objects.

/// Parameters container struct for `getUpdates` method
public struct GetUpdatesParams: Encodable {
    /// Identifier of the first update to be returned. Must be greater by one than the highest among the identifiers of previously received updates. By default, updates starting with the earliest unconfirmed update are returned. An update is considered confirmed as soon as getUpdates is called with an offset higher than its update_id. The negative offset can be specified to retrieve updates starting from -offset update from the end of the updates queue. All previous updates will forgotten.
    public var offset: Int?

    /// Limits the number of updates to be retrieved. Values between 1-100 are accepted. Defaults to 100.
    public var limit: Int?

    /// Timeout in seconds for long polling. Defaults to 0, i.e. usual short polling. Should be positive, short polling should be used for testing purposes only.
    public var timeout: Int?

    /// A JSON-serialized list of the update types you want your bot to receive. For example, specify [“message”, “edited_channel_post”, “callback_query”] to only receive updates of these types. See Update for a complete list of available update types. Specify an empty list to receive all update types except chat_member (default). If not specified, the previous setting will be used.
    ///
    /// Please note that this parameter doesn't affect updates created before the call to the getUpdates, so unwanted updates may be received for a short period of time.
    public var allowedUpdates: [String]?

    /// Custom keys for coding/decoding `GetUpdatesParams` struct
    public enum CodingKeys: String, CodingKey {
        case offset
        case limit
        case timeout
        case allowedUpdates = "allowed_updates"
    }

    public init(offset: Int? = nil, limit: Int? = nil, timeout: Int? = nil, allowedUpdates: [String]? = nil) {
        self.offset = offset
        self.limit = limit
        self.timeout = timeout
        self.allowedUpdates = allowedUpdates
    }
}

public extension Bot {
    /**
     Use this method to receive incoming updates using long polling (wiki). Returns an Array of Update objects.

     SeeAlso Telegram Bot API Reference:
     [GetUpdatesParams](https://core.telegram.org/bots/api#getupdates)

     - Parameters:
         - params: Parameters container, see `GetUpdatesParams` struct
     - Throws: Throws on errors
     - Returns: EventLoopFuture of `[Update]` type
     */
    @discardableResult
    func getUpdates(params: GetUpdatesParams? = nil) throws -> EventLoopFuture<[Update]> {
        let methodURL: URI = .init(string: getMethodURL("getUpdates"))
        let future: EventLoopFuture<[Update]> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
