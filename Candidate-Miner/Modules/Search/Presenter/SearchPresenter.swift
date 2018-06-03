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

    func viewDidload() {
        let filler = EmptyFiller(title: "Find a user",
                                 subTile: "Type something to\nsearch",
                                 actionName: nil)
        view?.adapt(toState: .empty(filler))
    }

    // MARK: Actions

    func touchedSearch(with key: String) {
        view?.adapt(toState: .loading)
        interactor?.searchUsers(by: key)
    }

    func numberOfCells() -> Int {
        return interactor?.numberOfUsers() ?? 0
    }

    func setContent<T>(_ view: T, at index: IndexPath) where T: Displayable {
        guard let user = interactor?.user(at: index.row) as? T.DisplayType else { return }
        view.configure(with: user)
    }

    func didSelectedCell(at index: IndexPath) {
        guard let user = interactor?.user(at: index.row) else { return }

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
