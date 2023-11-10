//
// Created by Austin Anaya on 11/9/23
//

import Foundation

extension Encodable {
    func asDictionary(encoder: JSONEncoder = JSONEncoder()) -> [String: Any]? {
        do {
            let data = try encoder.encode(self)
            return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
        } catch {
            return nil
        }
    }
}

enum EncodableError: Error {
    case asDictionary(Error)
}

extension EncodableError: CustomNSError {
    static var errorDomain: String {
        return String(describing: self)
    }

    var errorCode: Int {
        switch self {
        case .asDictionary: return 1
        }
    }

    var errorUserInfo: [String: Any] {
        switch self {
        case .asDictionary(let error): return ["thrownError": error]
        }
    }
}
