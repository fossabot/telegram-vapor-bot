import Vapor

/// Parameters container struct for `answerPreCheckoutQuery` method
public struct AnswerPreCheckoutQueryParams: Encodable {
    /// Unique identifier for the query to be answered
    public var preCheckoutQueryID: String

    /// Specify True if everything is alright (goods are available, etc.) and the bot is ready to proceed with the order. Use False if there are any problems.
    public var ok: Bool

    /// Required if ok is False. Error message in human readable form that explains the reason for failure to proceed with the checkout (e.g. "Sorry, somebody just bought the last of our amazing black T-shirts while you were busy filling out your payment details. Please choose a different color or garment!"). Telegram will display this message to the user.
    public var errorMessage: String?

    /// Custom keys for coding/decoding `AnswerPreCheckoutQueryParams` struct
    public enum CodingKeys: String, CodingKey {
        case preCheckoutQueryID = "pre_checkout_query_id"
        case ok
        case errorMessage = "error_message"
    }

    public init(preCheckoutQueryID: String, ok: Bool, errorMessage: String? = nil) {
        self.preCheckoutQueryID = preCheckoutQueryID
        self.ok = ok
        self.errorMessage = errorMessage
    }
}

public extension Bot {
    /// Once the user has confirmed their payment and shipping details, the Bot API sends the final confirmation in the form of an Update with the field pre\_checkout\_query. Use this method to respond to such pre-checkout queries. On success, True is returned. Note: The Bot API must receive an answer within 10 seconds after the pre-checkout query was sent.
    ///
    /// SeeAlso Telegram Bot API Reference:
    /// [AnswerPreCheckoutQueryParams](https://core.telegram.org/bots/api#answerprecheckoutquery)
    ///
    /// - Parameters:
    ///     - params: Parameters container, see `AnswerPreCheckoutQueryParams` struct
    /// - Throws: Throws on errors
    /// - Returns: EventLoopFuture of `Bool` type
    @discardableResult func answerPreCheckoutQuery(params: AnswerPreCheckoutQueryParams) throws
        -> EventLoopFuture<Bool>
    {
        let methodURL: URI = .init(string: getMethodURL("answerPreCheckoutQuery"))
        let future: EventLoopFuture<Bool> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
