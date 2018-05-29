//
//  GithubRequest.swift
//  Candidate-Miner
//
//  Created by Fernando Ferreira on 29/05/18.
//  Copyright © 2018 Fernando Ferreira. All rights reserved.
//

import Foundation
import Alamofire

enum GithubRequest: NetworkRequest {
    case search(keyWord: String)

    var baseURL: URL? { return URL(string: "https://api.github.com") }
    var path: String { return "search/users" }
    var method: HTTPMethod { return .get }
    var encoding: ParameterEncoding { return URLEncoding.default }

    var parameters: Parameters? {
        switch self {
        case .search(let keyWord):
            return [
                "q": keyWord
            ]
        }
    }

}
