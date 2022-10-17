import Vapor

/// Parameters container struct for `deleteChatStickerSet` method
public struct DeleteChatStickerSetParams: Encodable {
    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    public var chatID: ChatID

    /// Custom keys for coding/decoding `DeleteChatStickerSetParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
    }

    public init(chatID: ChatID) {
        self.chatID = chatID
    }
}

public extension Bot {
    /// Use this method to delete a group sticker set from a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights. Use the field can\_set\_sticker\_set optionally returned in getChat requests to check if the bot can use this method. Returns True on success.

    /// SeeAlso Telegram Bot API Reference:
    /// [DeleteChatStickerSetParams](https://core.telegram.org/bots/api#deletechatstickerset)

    /// - Parameters:
    ///     - params: Parameters container, see `DeleteChatStickerSetParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `Bool` type
    @discardableResult func deleteChatStickerSet(params: DeleteChatStickerSetParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("deleteChatStickerSet"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
