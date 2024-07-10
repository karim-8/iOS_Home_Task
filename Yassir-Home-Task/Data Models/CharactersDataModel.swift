//
//  CharactersDataModel.swift
//  Yassir-Home-Task
//
//  Created by Karim Soliman on 10/07/2024.
//

import Foundation

struct CharactersDataModel : Codable {
    let info : InfoDataModel?
    let results : [ResultsDataModel]?

    enum CodingKeys: String, CodingKey {

        case info = "info"
        case results = "results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        info = try values.decodeIfPresent(InfoDataModel.self, forKey: .info)
        results = try values.decodeIfPresent([ResultsDataModel].self, forKey: .results)
    }
}

