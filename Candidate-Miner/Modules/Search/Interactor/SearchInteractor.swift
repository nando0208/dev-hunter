//
// Created by Fernando Ferreira
// Copyright (c) 2018 Fernando Ferreira. All rights reserved.
//

import Foundation

final class SearchInteractor: SearchInteractorInputProtocol {
    // MARK: - Properties

    weak var presenter: SearchInteractorOutputProtocol?
    var APIDataManager: SearchAPIDataManagerInputProtocol?
    var localDatamanager: SearchLocalDataManagerInputProtocol?

    private var users: [User] = []

    // MARK: - Initialization

    init() {}

    func searchUsers(by keyWord: String) {
        APIDataManager?.fetchUsers(by: keyWord) {[weak self] result in
            switch result {
            case .success(let container):
                self?.users = container.users
                self?.presenter?.finishedSearch(with: nil)
            case .failure(let error):
                self?.presenter?.finishedSearch(with: error)
            }
        }
    }

    func user(at index: Int) -> UserViewModel? {
        guard let user = users.get(index) else { return .none }
        return UserViewModel(user: user)
    }
}
