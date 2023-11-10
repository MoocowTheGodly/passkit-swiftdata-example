//
// Created by Austin Anaya on 11/9/23
//

import Foundation

//protocol KeanuRequest {
//    var baseURL: URL { get }
//    var method: HTTPMethod { get }
//    var path: String { get }
//    var queryParameters: [String: Any] { get }
//}
//
//extension KeanuRequest {
//    var baseURL: URL {
//        return URL(string: "https://staging.api-gateway.campgladiator.com/")!
//    }

//    func asURLRequest() throws -> URLRequest {
//        let url = baseURL.appendingPathComponent(path)
//        var request = URLRequest(url: url)
//
//        do {
//            switch method {
//            case .post, .put: return try JSONEncoding.default.encode(request, with: queryParameters)
//            default: return try URLEncoding.default.encode(request, with: queryParameters)
//            }
//        } catch {
//            LoggingService.record(KeanuRequestError.asURLRequest(queryParameters, error), message: "Error trying to encode keanu service url request")
//            throw error
//        }
//    }
//}


//public struct HTTPMethod: RawRepresentable, Equatable, Hashable {
//    public static let delete = HTTPMethod(rawValue: "DELETE")
//    public static let get = HTTPMethod(rawValue: "GET")
//    public static let post = HTTPMethod(rawValue: "POST")
//    public static let put = HTTPMethod(rawValue: "PUT")
//
//    public let rawValue: String
//
//    public init(rawValue: String) {
//        self.rawValue = rawValue
//    }
//}

