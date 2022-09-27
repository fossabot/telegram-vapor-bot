import Vapor

/// DESCRIPTION:
/// Use this method to delete a chat photo. Photos can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success.

/// Parameters container struct for `deleteChatPhoto` method
public struct DeleteChatPhotoParams: Encodable {
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    public var chatId: ChatId

    /// Custom keys for coding/decoding `DeleteChatPhotoParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatId = "chat_id"
    }

    public init(chatId: ChatId) {
        self.chatId = chatId
    }
}

public extension Bot {
    /**
     Use this method to delete a chat photo. Photos can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Returns True on success.

     SeeAlso Telegram Bot API Reference:
     [DeleteChatPhotoParams](https://core.telegram.org/bots/api#deletechatphoto)

     - Parameters:
         - params: Parameters container, see `DeleteChatPhotoParams` struct
     - Throws: Throws on errors
     - Returns: EventLoopFuture of `Bool` type
     */
    @discardableResult
    func deleteChatPhoto(params: DeleteChatPhotoParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("deleteChatPhoto"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
