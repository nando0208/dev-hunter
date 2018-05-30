//
// Created by Fernando Ferreira
// Copyright (c) 2018 Fernando Ferreira. All rights reserved.
//

import Foundation

final class SearchPresenter: SearchPresenterProtocol {

    // MARK: - Properties

    weak var view: (SearchViewProtocol & Stateful)?
    var interactor: SearchInteractorInputProtocol?
    var router: SearchRouterProtocol?

    // MARK: Initialization

    init() {}

    // MARK: Actions
    func viewDidload() {}

    func touchedSearch(with key: String) {
        interactor?.searchUsers(by: key)
    }
}

// MARK: - SearchInteractorOutputProtocol

extension SearchPresenter: SearchInteractorOutputProtocol {
    func finishedSearch(with error: Error?) {
        guard let error = error else {
            view?.adapt(toState: .content)
            return
        }

        let empty = EmptyFiller(title: "Error",
                                subTile: error.localizedDescription,
                                actionName: "Try Again")
        view?.adapt(toState: .error(empty))
    }
}
