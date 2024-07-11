//
//  Network Helper.swift
//  Yassir-Home-Task
//
//  Created by Karim Soliman on 11/07/2024.
//

import Foundation

    // Todo Seperate in helpers
enum urlEndPoint: String {
    case baseUrl = "https://rickandmortyapi.com/api/character/"
}

struct request: RequestProtocol {
    let baseUrl: String?
    let qParameters: String?

    init(url: String, param: String){
        self.baseUrl = url
        self.qParameters = param
    }
    var url: URL {
        return URL(string: baseUrl! + qParameters!)!
    }
}
