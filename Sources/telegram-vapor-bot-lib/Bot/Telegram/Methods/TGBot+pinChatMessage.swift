// Telegram-vapor-bot-lib - Telegram Bot Swift SDK.
// This file is autogenerated by API/generate_wrappers.rb script.

import Vapor

public extension TGBot {

    /// Parameters container struct for `pinChatMessage` method
    struct PinChatMessageParams: Encodable {

        /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
        var chatId: ChatId

        /// Identifier of a message to pin
        var messageId: Int

        /// Pass True, if it is not necessary to send a notification to all chat members about the new pinned message. Notifications are always disabled in channels and private chats.
        var disableNotification: Bool?

        /// Custom keys for coding/decoding `PinChatMessageParams` struct
        enum CodingKeys: String, CodingKey {
            case chatId = "chat_id"
            case messageId = "message_id"
            case disableNotification = "disable_notification"
        }

        public init(chatId: ChatId, messageId: Int, disableNotification: Bool? = nil) {
            self.chatId = chatId
            self.messageId = messageId
            self.disableNotification = disableNotification
        }
    }

    /**
     Use this method to add a message to the list of pinned messages in a chat. If the chat is not a private chat, the bot must be an administrator in the chat for this to work and must have the 'can_pin_messages' admin right in a supergroup or 'can_edit_messages' admin right in a channel. Returns True on success.

     SeeAlso Telegram Bot API Reference:
     [PinChatMessageParams](https://core.telegram.org/bots/api#pinchatmessage)
     
     - Parameters:
         - params: Parameters container, see `PinChatMessageParams` struct
     - Throws: Throws on errors
     - Returns: EventLoopFuture of `Bool` type
     */
    @discardableResult
    func pinChatMessage(params: PinChatMessageParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("pinChatMessage"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}