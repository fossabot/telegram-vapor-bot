import Vapor

/// DESCRIPTION:
/// Use this method to get the current default administrator rights of the bot. Returns ChatAdministratorRights on success.

/// Parameters container struct for `getMyDefaultAdministratorRights` method
public struct GetMyDefaultAdministratorRightsParams: Encodable {
    /// Pass True to get default administrator rights of the bot in channels. Otherwise, default administrator rights of the bot for groups and supergroups will be returned.
    public var forChannels: Bool?

    /// Custom keys for coding/decoding `GetMyDefaultAdministratorRightsParams` struct
    public enum CodingKeys: String, CodingKey {
        case forChannels = "for_channels"
    }

    public init(forChannels: Bool? = nil) {
        self.forChannels = forChannels
    }
}

public extension Bot {
    /**
     Use this method to get the current default administrator rights of the bot. Returns ChatAdministratorRights on success.

     SeeAlso Telegram Bot API Reference:
     [GetMyDefaultAdministratorRightsParams](https://core.telegram.org/bots/api#getmydefaultadministratorrights)

     - Parameters:
         - params: Parameters container, see `GetMyDefaultAdministratorRightsParams` struct
     - Throws: Throws on errors
     - Returns: EventLoopFuture of `ChatAdministratorRights` type
     */
    @discardableResult
    func getMyDefaultAdministratorRights(params: GetMyDefaultAdministratorRightsParams? = nil) throws -> EventLoopFuture<ChatAdministratorRights> {
        let methodURL: URI = .init(string: getMethodURL("getMyDefaultAdministratorRights"))
        let future: EventLoopFuture<ChatAdministratorRights> = tgClient.post(methodURL, params: params, as: nil)
        return future
    }
}
