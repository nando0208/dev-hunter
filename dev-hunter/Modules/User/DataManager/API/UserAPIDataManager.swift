//
// Created by Fernando Ferreira
// Copyright (c) 2018 Fernando Ferreira. All rights reserved.
//

import Foundation
import Alamofire

final class UserAPIDataManager: UserAPIDataManagerInputProtocol {

    // MARK: - Initialization

    init() {}

    func fetchRepositories(by userName: String, completion: @escaping (Result<[Repository]>) -> Void) {
        let request = GithubRequest.repositories(userNams: userName)
        Network.request(request, completion: completion)
    }
}
