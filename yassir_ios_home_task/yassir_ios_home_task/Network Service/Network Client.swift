//
//  Network Client.swift
//  Yassir-Home-Task
//
//  Created by Karim Soliman on 10/07/2024.
//

import Foundation


protocol RequestProtocol {
    var url:URL {get}
}
enum NetwrokError: Error {
    case noData
    case netwrokError
}

class NetworkClient {

    //MARK:- GET REQUEST
    func fetchData(url: RequestProtocol, completion: @escaping (Result<Data,Error>)-> ()) {
        let requesturl = URLRequest(url: url.url)
        URLSession.shared.dataTask(with: requesturl) { (data, response, error) in
            // Network Error case returned
            if error != nil {
                print("Error in...\(String(describing: error))")
                completion(.failure(NetwrokError.netwrokError))
                return
            }
            // No Data case
            guard let data = data else {
                completion(.failure(NetwrokError.noData))
                return
            }
            completion(.success(data))
        }.resume()
    }
}
