#if compiler(>=5.5) && canImport(_Concurrency)
    import Foundation
    import Vapor

    public protocol AsyncClientProtocol: ClientProtocol {
        @discardableResult func get<Params: Encodable, Response: Codable>(
            _ url: URI,
            params: Params?,
            as mediaType: Vapor.HTTPMediaType?
        ) async throws -> Response

        @discardableResult func get<Response: Codable>(_ url: URI) async throws -> Response

        @discardableResult func get<Response: Codable>(_ url: URI, as mediaType: Vapor.HTTPMediaType) async throws
            -> Response

        @discardableResult func post<Params: Encodable, Response: Codable>(
            _ url: URI,
            params: Params?,
            as mediaType: Vapor.HTTPMediaType?
        ) async throws
            -> Response

        @discardableResult func post<Response: Codable>(_ url: URI) async throws -> Response

        @discardableResult func post<Response: Codable>(_ url: URI, as mediaType: Vapor.HTTPMediaType) async throws
            -> Response
    }

    public extension AsyncClientProtocol {
        @discardableResult func get<Params: Encodable, Response: Codable>(
            _ url: URI,
            params: Params?,
            as mediaType: Vapor.HTTPMediaType?
        ) -> EventLoopFuture<Response> {
            let promise = client.eventLoop.makePromise(of: Response.self)
            promise.completeWithTask {
                try await get(url, params: params, as: mediaType)
            }
            return promise.futureResult
        }

        @discardableResult func get<Response: Codable>(_ url: URI) -> EventLoopFuture<Response> {
            let promise = client.eventLoop.makePromise(of: Response.self)
            promise.completeWithTask {
                try await get(url)
            }
            return promise.futureResult
        }

        @discardableResult func get<Response: Codable>(
            _ url: URI,
            as mediaType: Vapor.HTTPMediaType
        ) -> EventLoopFuture<Response> {
            let promise = client.eventLoop.makePromise(of: Response.self)
            promise.completeWithTask {
                try await get(url, as: mediaType)
            }
            return promise.futureResult
        }

        @discardableResult func post<Params: Encodable, Response: Codable>(
            _ url: URI,
            params: Params?,
            as mediaType: Vapor.HTTPMediaType?
        ) -> EventLoopFuture<Response> {
            let promise = client.eventLoop.makePromise(of: Response.self)
            promise.completeWithTask {
                try await post(url, params: params, as: mediaType)
            }
            return promise.futureResult
        }

        @discardableResult func post<Response: Codable>(_ url: URI) -> EventLoopFuture<Response> {
            let promise = client.eventLoop.makePromise(of: Response.self)
            promise.completeWithTask {
                try await post(url)
            }
            return promise.futureResult
        }

        @discardableResult func post<Response: Codable>(
            _ url: URI,
            as mediaType: Vapor.HTTPMediaType
        ) -> EventLoopFuture<Response> {
            let promise = client.eventLoop.makePromise(of: Response.self)
            promise.completeWithTask {
                try await post(url, as: mediaType)
            }
            return promise.futureResult
        }
    }

    @available(macOS 12, *)
    extension DefaultClient: AsyncClientProtocol {
        @discardableResult public func get<Params: Encodable, Response: Codable>(
            _ url: URI,
            params: Params? = nil,
            as mediaType: Vapor.HTTPMediaType? = nil
        ) async throws -> Response {
            let clientResponse: ClientResponse = try await client.get(url, headers: HTTPHeaders()) { clientRequest in
                if mediaType == .formData || mediaType == nil {
                    //                #warning("THIS CODE FOR FAST FIX, BECAUSE https://github.com/vapor/multipart-kit/issues/63 not accepted yet")
                    var rawMultipart: (body: NSMutableData, boundary: String)!
                    do {
                        /// Content-Disposition: form-data; name="nested\_object"
                        ///
                        /// { json string }
                        rawMultipart = try (params ?? (EmptyParams() as! Params)).toMultiPartFormData()
                    } catch {
                        Bot.log.critical(error.logMessage)
                    }
                    clientRequest.headers.add(
                        name: "Content-Type",
                        value: "multipart/form-data; boundary=\(rawMultipart.boundary)"
                    )
                    let buffer = ByteBuffer(data: rawMultipart.body as Data)
                    clientRequest.body = buffer
                } else {
                    if let currentParams: Params = params {
                        try clientRequest.content.encode(currentParams, as: mediaType ?? .json)
                    } else {
                        try clientRequest.content.encode(EmptyParams(), as: mediaType ?? .json)
                    }
                }
            }

            let telegramContainer = try clientResponse.content.decode(TelegramContainer<Response>.self)
            return try processContainer(telegramContainer)
        }

        @discardableResult public func get<Response: Codable>(_ url: URI) async throws -> Response {
            try await get(url, params: EmptyParams(), as: nil)
        }

        @discardableResult public func get<Response: Codable>(
            _ url: URI,
            as mediaType: Vapor.HTTPMediaType
        ) async throws -> Response {
            try await get(url, params: EmptyParams(), as: mediaType)
        }

        @discardableResult public func post<Params: Encodable, Response: Codable>(
            _ url: URI,
            params: Params? = nil,
            as mediaType: Vapor.HTTPMediaType? = nil
        ) async throws -> Response {
            let clientResponse: ClientResponse = try await client.post(url, headers: HTTPHeaders()) { clientRequest in
                if mediaType == .formData || mediaType == nil {
                    //                #warning("THIS CODE FOR FAST FIX, BECAUSE https://github.com/vapor/multipart-kit/issues/63 not accepted yet")
                    var rawMultipart: (body: NSMutableData, boundary: String)!
                    do {
                        /// Content-Disposition: form-data; name="nested\_object"
                        ///
                        /// { json string }
                        if let currentParams: Params = params {
                            rawMultipart = try currentParams.toMultiPartFormData()
                        } else {
                            rawMultipart = try EmptyParams().toMultiPartFormData()
                        }
                    } catch {
                        Bot.log.critical("Post request error: \(error.logMessage)")
                    }
                    clientRequest.headers.add(
                        name: "Content-Type",
                        value: "multipart/form-data; boundary=\(rawMultipart.boundary)"
                    )
                    let buffer = ByteBuffer(data: rawMultipart.body as Data)
                    clientRequest.body = buffer
                    /// Debug
                    //                Bot.log.critical("url: \(url)\n\(String(decoding: rawMultipart.body, as: UTF8.self))")
                } else {
                    try clientRequest.content.encode(params ?? (EmptyParams() as! Params), as: mediaType ?? .json)
                }
            }

            let telegramContainer = try clientResponse.content.decode(TelegramContainer<Response>.self)
            return try processContainer(telegramContainer)
        }

        @discardableResult public func post<Response: Codable>(_ url: URI) async throws -> Response {
            try await post(url, params: EmptyParams(), as: nil)
        }

        @discardableResult public func post<Response: Codable>(
            _ url: URI,
            as mediaType: Vapor.HTTPMediaType
        ) async throws -> Response {
            try await post(url, params: EmptyParams(), as: mediaType)
        }

        private func processContainer<T: Codable>(_ container: TelegramContainer<T>) throws -> T {
            guard container.ok else {
                let desc = """
                Response marked as `not Ok`, it seems something wrong with request
                Code: \(container.errorCode ?? -1)
                \(container.description ?? "Empty")
                """
                let error = CoreError(
                    type: .server,
                    description: desc
                )
                Bot.log.error(error.logMessage)
                throw error
            }

            guard let result = container.result else {
                let error = CoreError(
                    type: .server,
                    reason: "Response marked as `Ok`, but doesn't contain `result` field."
                )
                Bot.log.error(error.logMessage)
                throw error
            }

            let logString = """

            Response:
            Code: \(container.errorCode ?? 0)
            Status OK: \(container.ok)
            Description: \(container.description ?? "Empty")

            """
            Bot.log.info(logString.logMessage)
            return result
        }
    }
#endif
