import Vapor

/// Parameters container struct for `createNewStickerSet` method
public struct CreateNewStickerSetParams: Encodable {
    /// User identifier of created sticker set owner
    public var userID: Int64

    /// Short name of sticker set, to be used in t.me/addstickers/ URLs (e.g., animals). Can contain only English letters, digits and underscores. Must begin with a letter, can't contain consecutive underscores and must end in "\_by\_<bot\_username>". <bot\_username> is case insensitive. 1-64 characters.
    public var name: String

    /// Sticker set title, 1-64 characters
    public var title: String

    /// PNG image with the sticker, must be up to 512 kilobytes in size, dimensions must not exceed 512px, and either width or height must be exactly 512px. Pass a file\_id as a String to send a file that already exists on the Telegram servers, pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart/form-data. More information on Sending Files »
    public var pngSticker: FileInfo?

    /// S animation with the sticker, uploaded using multipart/form-data. See https://core.telegram.org/stickers#animated-sticker-requirements for technical requirements
    public var tgsSticker: InputFile?

    /// WEBM video with the sticker, uploaded using multipart/form-data. See https://core.telegram.org/stickers#video-sticker-requirements for technical requirements
    public var webmSticker: InputFile?

    /// Type of stickers in the set, pass “regular” or “mask”. Custom emoji sticker sets can't be created via the Bot API at the moment. By default, a regular sticker set is created.
    public var stickerType: String?

    /// One or more emoji corresponding to the sticker
    public var emojis: String

    /// A JSON-serialized object for position where the mask should be placed on faces
    public var maskPosition: MaskPosition?

    /// Custom keys for coding/decoding `CreateNewStickerSetParams` struct
    public enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case name
        case title
        case pngSticker = "png_sticker"
        case tgsSticker = "tgs_sticker"
        case webmSticker = "webm_sticker"
        case stickerType = "sticker_type"
        case emojis
        case maskPosition = "mask_position"
    }

    public init(
        userID: Int64,
        name: String,
        title: String,
        pngSticker: FileInfo? = nil,
        tgsSticker: InputFile? = nil,
        webmSticker: InputFile? = nil,
        stickerType: String? = nil,
        emojis: String,
        maskPosition: MaskPosition? = nil
    ) {
        self.userID = userID
        self.name = name
        self.title = title
        self.pngSticker = pngSticker
        self.tgsSticker = tgsSticker
        self.webmSticker = webmSticker
        self.stickerType = stickerType
        self.emojis = emojis
        self.maskPosition = maskPosition
    }
}

public extension Bot {
    /// Use this method to create a new sticker set owned by a user. The bot will be able to edit the sticker set thus created. You must use exactly one of the fields png\_sticker, tgs\_sticker, or webm\_sticker. Returns True on success.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [CreateNewStickerSetParams](https://core.telegram.org/bots/api#createnewstickerset)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `CreateNewStickerSetParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `Bool` type
    @discardableResult func createNewStickerSet(params: CreateNewStickerSetParams) throws -> EventLoopFuture<Bool> {
        let methodURL: URI = .init(string: getMethodURL("createNewStickerSet"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
