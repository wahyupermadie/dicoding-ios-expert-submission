//
//  GameRepository.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 07/12/20.
//

import Foundation
import Combine
import Alamofire

protocol GameRepository{
    func getGames(search: String?) -> AnyPublisher<GameResponse, Error>?
}

class GameRepositoryImpl: GameRepository {
    var baseURL: URL
    
    init(baseUrl: URL) {
        self.baseURL = baseUrl
    }
    
    func getGames(search: String?) -> AnyPublisher<GameResponse, Error>? {
        guard let url = URL(string: "\(self.baseURL)games") else {
            return nil
        }
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return nil
        }
        if search != nil {
            let queryItems = [URLQueryItem(name: "search", value: search)]
            urlComponents.queryItems = queryItems
        }
        guard let finalURL = urlComponents.url else {
            return nil
        }
        return Future<GameResponse, Error> { completion in
            AF.request(finalURL)
                .validate()
                .responseDecodable(of: GameResponse.self) { resp in
                    switch resp.result {
                    case .success(let data):
                        completion(.success(data))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
        }.eraseToAnyPublisher()
    }
}
