//
//  Network Client.swift
//  Yassir-Home-Task
//
//  Created by Karim Soliman on 10/07/2024.
//

import Foundation

    //- URL as a parameter or in protocol
    //- get request
    //- Return handler

protocol RequestProtocol {
        //url - qp - interceptors - ....
    var url:URL {get}
}
enum NetwrokError: Error {
    case noData
    case netwrokError
}

class NetworkClient {
    var isPaginating = false
    
    //MARK:- GET REQUEST
    func get(url: RequestProtocol, completion: @escaping (Result<Data,Error>)-> ()) {
        let requesturl = URLRequest(url: url.url)
       // isPaginating = true
        URLSession.shared.dataTask(with: requesturl) { (data, response, error) in
                //Error case returned
            if error != nil {
                print("Error in...\(String(describing: error))")
                completion(.failure(NetwrokError.netwrokError))
                return
            }
                //No Data case
            guard let data = data else {
                completion(.failure(NetwrokError.noData))

                return
            }
            completion(.success(data))
           // self.isPaginating = false

        }.resume()
    }
}


