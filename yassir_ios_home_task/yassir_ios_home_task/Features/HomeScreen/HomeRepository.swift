//
//  HomeRepository.swift
//  Yassir-Home-Task
//
//  Created by Karim Soliman on 10/07/2024.
//

import Foundation

protocol HomeRepositoryProtocol {
    func fetchData(from request: RequestProtocol, completion: @escaping (Result<CharactersDataModel, Error>) -> Void)
}

class HomeRepository: HomeRepositoryProtocol {

    //MARK:- VARIABLES
    private let networkClient: NetworkClient

    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }

    //MARK:- FETCH DATA
    func fetchData(from request: RequestProtocol, completion: @escaping (Result<CharactersDataModel, Error>) -> Void) {
        networkClient.fetchData(url: request) { result in
            switch result {
            case .success(let data):
                // Decode JSON data here
                if let charactersData = self.decodeJsonResult(jsonData: data) {
                    completion(.success(charactersData))
                } else {
                    let decodingError = NSError(domain: "DecodingError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to decode JSON data"])
                    completion(.failure(decodingError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    // MARK:- Decode JSON Result
    private func decodeJsonResult(jsonData: Data) -> CharactersDataModel? {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            decoder.dateDecodingStrategy = .secondsSince1970

            let userData = try decoder.decode(CharactersDataModel.self, from: jsonData)
            return userData
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }
}
