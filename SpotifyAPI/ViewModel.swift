//
//  ViewModel.swift
//  SpotifyAPI
//
//  Created by Karthik on 16/10/20.
//



class ViewModel {
    // MARK: - Dependencies
    private let networkManager: NetworkManager = MoyaNetworkManager()
}

// MARK: - View entry points
extension ViewModel {
    func makeAPIRequestButtonPressed(completion: @escaping (String) -> ()) {
        let query = "Harris Jeyaraj"
        let type = "artist"
        networkManager.search(query: query, type: type, completion: completion)
    }
}
