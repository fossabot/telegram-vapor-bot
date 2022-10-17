import Vapor

/// Parameters container struct for `setChatMenuButton` method
public struct SetChatMenuButtonParams: Encodable {
    /// Unique identifier for the target private chat. If not specified, default bot's menu button will be changed
    public var chatID: Int64?

    /// A JSON-serialized object for the bot's new menu button. Defaults to MenuButtonDefault
    public var menuButton: MenuButton?

    /// Custom keys for coding/decoding `SetChatMenuButtonParams` struct
    public enum CodingKeys: String, CodingKey {
        case chatID = "chat_id"
        case menuButton = "menu_button"
    }

    public init(chatID: Int64? = nil, menuButton: MenuButton? = nil) {
        self.chatID = chatID
        self.menuButton = menuButton
    }
}

public extension Bot {
    /// Use this method to change the bot's menu button in a private chat, or the default menu button. Returns True on success.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [SetChatMenuButtonParams](https://core.telegram.org/bots/api#setchatmenubutton)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `SetChatMenuButtonParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `Bool` type
    @discardableResult func setChatMenuButton(params: SetChatMenuButtonParams? = nil) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("setChatMenuButton"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
