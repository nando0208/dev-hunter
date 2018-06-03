//
// Created by Fernando Ferreira
// Copyright (c) 2018 Fernando Ferreira. All rights reserved.
//

import Foundation

final class UserInteractor: UserInteractorInputProtocol {

    // MARK: - Properties

    weak var presenter: UserInteractorOutputProtocol?
    var APIDataManager: UserAPIDataManagerInputProtocol?
    var localDatamanager: UserLocalDataManagerInputProtocol?

    let user: User
    var repos: [Repository] = []

    // MARK: - Initialization

    init(user: User) {
        self.user = user
    }

    func fetchRepositories() {
        APIDataManager?.fetchRepositories(by: user.userName) {[weak self] result in
            switch result {
            case .success(let repos):
                self?.repos = repos
                self?.presenter?.finishedLoad(with: nil)
            case .failure(let error):
                self?.presenter?.finishedLoad(with: error)
            }
        }
    }

    func numberOfRepositories() -> Int {
        return repos.count
    }

    func repository(at index: Int) -> RepositoryViewModel? {
        guard let repo = repos.get(index) else { return nil }
        return RepositoryViewModel(repository: repo)
    }
}
