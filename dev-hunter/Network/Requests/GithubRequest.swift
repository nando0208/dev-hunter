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
    case repositories(userNams: String)

    var baseURL: URL? { return URL(string: "https://api.github.com") }
    var path: String {
        switch self {
        case .search:
            return "search/users"
        case .repositories(let userName):
            return "users/\(userName)/repos"
        }
    }
    var method: HTTPMethod { return .get }
    var encoding: ParameterEncoding { return URLEncoding.default }

    var parameters: Parameters? {
        switch self {
        case .search(let keyWord):
            return [
                "q": keyWord
            ]
        case .repositories:
            return nil
        }
    }
}
