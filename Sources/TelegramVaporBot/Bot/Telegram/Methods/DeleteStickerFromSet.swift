import Vapor

/// Parameters container struct for `deleteStickerFromSet` method
public struct DeleteStickerFromSetParams: Encodable {
    /// File identifier of the sticker
    public var sticker: String

    /// Custom keys for coding/decoding `DeleteStickerFromSetParams` struct
    public enum CodingKeys: String, CodingKey {
        case sticker
    }

    public init(sticker: String) {
        self.sticker = sticker
    }
}

public extension Bot {
    /// Use this method to delete a sticker from a set created by the bot. Returns True on success.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [DeleteStickerFromSetParams](https://core.telegram.org/bots/api#deletestickerfromset)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `DeleteStickerFromSetParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `Bool` type
    @discardableResult func deleteStickerFromSet(params: DeleteStickerFromSetParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("deleteStickerFromSet"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
