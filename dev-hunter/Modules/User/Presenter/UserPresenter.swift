//
// Created by Fernando Ferreira
// Copyright (c) 2018 Fernando Ferreira. All rights reserved.
//

import Foundation

final class UserPresenter: UserPresenterProtocol {
    // MARK: - Properties

    weak var view: (UserViewProtocol & Stateful)?
    var interactor: UserInteractorInputProtocol?
    var router: UserRouterProtocol?

    // MARK: Initialization

    init() {}

    func viewDidload() {
        interactor?.fetchRepositories()
        view?.transition(toState: .loading)
    }

    func numberOfCells() -> Int {
        return interactor?.numberOfRepositories() ?? 0
    }

    func setContent<T>(_ view: T, at index: IndexPath) where T: Displayable {
        guard let repo = interactor?.repository(at: index.row) as? T.DisplayType else { return }
        view.configure(with: repo)
    }
}

// MARK: - UserInteractorOutputProtocol

extension UserPresenter: UserInteractorOutputProtocol {
    func finishedLoad(with error: Error?) {
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
