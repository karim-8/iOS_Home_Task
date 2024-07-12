//
//  ListHomeUseCase.swift
//  Yassir-Home-Task
//
//  Created by Karim Soliman on 06/07/2024.
//

import Foundation

protocol HomeUseCaseProtocol {
    func fetchData(from request: RequestProtocol, completion: @escaping (Result<CharactersDataModel, Error>) -> Void)
}

class HomeUseCase: HomeUseCaseProtocol {

    private let repository: HomeRepository

    init(repository: HomeRepository) {
        self.repository = repository
    }

    func fetchData(from request: RequestProtocol, completion: @escaping (Result<CharactersDataModel, Error>) -> Void) {
        repository.fetchData(from: request) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
