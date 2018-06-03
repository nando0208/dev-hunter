//
//  Repository.swift
//  Candidate-Miner
//
//  Created by Fernando Ferreira on 03/06/18.
//  Copyright © 2018 Fernando Ferreira. All rights reserved.
//

import Foundation

struct Repository: Decodable {
    let name: String
    let repoID: Int
    let updatedDate: String
    let stars: Int

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case repoID = "id"
        case updatedDate = "updated_at"
        case stars = "stargazers_count"
    }
}
