

/**
 This object contains information about an incoming pre-checkout query.

 SeeAlso Telegram Bot API Reference:
 [PreCheckoutQuery](https://core.telegram.org/bots/api#precheckoutquery)
 */
public final class PreCheckoutQuery: Codable {
    /// Custom keys for coding/decoding `PreCheckoutQuery` struct
    public enum CodingKeys: String, CodingKey {
        case id
        case from
        case currency
        case totalAmount = "total_amount"
        case invoicePayload = "invoice_payload"
        case shippingOptionId = "shipping_option_id"
        case orderInfo = "order_info"
    }

    /// Unique query identifier
    public var id: String

    /// User who sent the query
    public var from: User

    /// Three-letter ISO 4217 currency code
    public var currency: String

    /// Total price in the smallest units of the currency (integer, not float/double). For example, for a price of US$ 1.45 pass amount = 145. See the exp parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
    public var totalAmount: Int

    /// Bot specified invoice payload
    public var invoicePayload: String

    /// Optional. Identifier of the shipping option chosen by the user
    public var shippingOptionId: String?

    /// Optional. Order information provided by the user
    public var orderInfo: OrderInfo?

    public init(id: String, from: User, currency: String, totalAmount: Int, invoicePayload: String, shippingOptionId: String? = nil, orderInfo: OrderInfo? = nil) {
        self.id = id
        self.from = from
        self.currency = currency
        self.totalAmount = totalAmount
        self.invoicePayload = invoicePayload
        self.shippingOptionId = shippingOptionId
        self.orderInfo = orderInfo
    }
}
