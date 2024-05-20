//
//  DogAPIClient.swift
//  MVPattern
//
//  Created by Anthony Tran on 20/5/24.
//

import Foundation

class APIClient {
    struct Configuration {
        let baseURL: URL
        
        init(baseURL: URL) {
            self.baseURL = baseURL
        }
    }
    
    let session: URLSession
    let configuration: Configuration
    
    init(session: URLSession, configuration: Configuration) {
        self.session = session
        self.configuration = configuration
    }
    
    func execute<Request: APIRequest>(_ request: Request)
    async throws -> Request.Response {
        let (data, _) = try await session.data(for: request.makeURLRequest(configuration: self.configuration))
        return try request.decode(data: data)
    }
}
