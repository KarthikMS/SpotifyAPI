//
//  NetworkManager.swift
//  SpotifyAPI
//
//  Created by Karthik on 16/10/20.
//

import Moya

protocol NetworkManager {
    func search(query: String, type: String, completion: @escaping (String) -> Void)
}

class MoyaNetworkManager: NetworkManager {
    private let provider = MoyaProvider<SpotifyTarget>()
}

extension MoyaNetworkManager {
    func search(query: String, type: String, completion: @escaping (String) -> Void) {
        provider.request(.search(query: query, type: type)) { result in
            switch result {
            case let .success(response):
                guard let json = try? response.mapString() else { return }
                completion(json)
            case let .failure(error):
                print("Search error: \(error.failureReason)")
            }
        }
    }
}
