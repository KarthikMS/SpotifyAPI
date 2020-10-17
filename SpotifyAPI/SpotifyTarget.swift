//
//  SpotifyTarget.swift
//  SpotifyAPI
//
//  Created by Karthik on 16/10/20.
//

import Moya

enum SpotifyTarget: TargetType {
    case search(query: String, type: String)
    
    static var authToken: String? = "BQAmLZYGFXpTeBoBilgIWVsuBWIrW4Q_pm2PNv6yTr7ugiD03gB5NQQVvJWRlrkx65B60V-lDy00RHXmo9pO4xofcwKXCnmbN_Okloa2yls0T9s5uPmpTM6UPECtcWfj4PsEARN9hRep6B10Vh6wAssFA1DTK-s"
}

// MARK: - TargetType
extension SpotifyTarget {
    var baseURL: URL { URL(string: "https://api.spotify.com/v1/")! }
    
    var path: String {
        switch self {
        case .search: return "search"
        }
    }
    
    var method: Method {
        switch self {
        case .search: return .get
        }
    }
    
    var sampleData: Data { Data() }
    
    var task: Task {
        switch self {
        case let .search(query, type):
            return .requestParameters(
                parameters: [
                    "q": query,
                    "type": type
                ],
                encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        [
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer \(SpotifyTarget.authToken ?? "")"
        ]
    }
}
