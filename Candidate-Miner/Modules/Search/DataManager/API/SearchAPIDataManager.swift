//
// Created by Fernando Ferreira
// Copyright (c) 2018 Fernando Ferreira. All rights reserved.
//

import Foundation
import Alamofire

final class SearchAPIDataManager: SearchAPIDataManagerInputProtocol {

    // MARK: - Initialization

    init() {}
    func fetchUsers(by key: String, completion: @escaping (Result<SearchContainer>) -> Void) {
        let request = GithubRequest.search(keyWord: key)
        Network.request(request, completion: completion)
    }
}
