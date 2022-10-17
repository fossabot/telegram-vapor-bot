import Vapor

/// Parameters container struct for `declineChatJoinRequest` method
public struct DeclineChatJoinRequestParams: Encodable {
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatID: ChatID

    /// Unique identifier of the target user
    public var userID: Int64

    /// Custom keys for coding/decoding `DeclineChatJoinRequestParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
        case userID = "user_id"
    }

    public init(chatID: ChatID, userID: Int64) {
        self.chatID = chatID
        self.userID = userID
    }
}

public extension Bot {
    /// Use this method to decline a chat join request. The bot must be an administrator in the chat for this to work and must have the can\_invite\_users administrator right. Returns True on success.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [DeclineChatJoinRequestParams](https://core.telegram.org/bots/api#declinechatjoinrequest)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `DeclineChatJoinRequestParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `Bool` type
    @discardableResult func declineChatJoinRequest(params: DeclineChatJoinRequestParams) throws
        -> EventLoopFuture<Bool>
    {
        let methodURL: URI = .init(string: getMethodURL("declineChatJoinRequest"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
