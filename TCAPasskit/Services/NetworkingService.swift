//
// Created by Austin Anaya on 11/9/23
//

import Foundation

class NetworkingService {
    static var shared: NetworkingService = {
        let instance = NetworkingService()
        return instance
    }()

    func load<T: Codable>(_ resource: Resource<T>) async throws -> T {
        var request = URLRequest(url: resource.url)
        request.allHTTPHeaderFields = resource.headers
        request.httpMethod = resource.method.name

        switch resource.method {
            case let .get(queryItems):
                var components = URLComponents(url: resource.url, resolvingAgainstBaseURL: true)
                components?.queryItems = queryItems
                print("components: \(components)")
                guard let url = components?.url else {
                    throw NetworkError.badURL
                }
                print("componenturl: \(url)")
                request.url = url
            case let .post(data):
                request.httpBody = data

            default:
                break
        }

        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
//        configuration.httpAdditionalHeaders = [""]

        let session = URLSession(configuration: configuration)

        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 || httpResponse.statusCode == 201
        else {
            throw NetworkError.invalidResponse
        }

        guard let result = try? JSONDecoder().decode(T.self, from: data) else {
            throw NetworkError.decodingError
        }

        return result
    }
}

enum NetworkError: Error {
    case badURL
    case invalidRequest
    case invalidResponse
    case decodingError
}

enum HTTPMethod {
    case get([URLQueryItem])
    case post(Data?)
    case put(Data?)

    var name: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        }
    }
}

struct Resource<T: Codable> {
    let url: URL
    var headers: [String: String] = [:]
    var method: HTTPMethod = .get([])
}
