//
// Created by Fernando Ferreira
// Copyright (c) 2018 Fernando Ferreira. All rights reserved.
//

import UIKit

final class UserRouter: UserRouterProtocol {

    // MARK: - Presenting

    static func presentUserModule(with user: User) -> UIViewController? {

        // Generating module components
        let view: UserViewProtocol & Stateful = UserView()
        let presenter: UserPresenterProtocol & UserInteractorOutputProtocol = UserPresenter()
        let interactor: UserInteractorInputProtocol = UserInteractor(user: user)
        let APIDataManager: UserAPIDataManagerInputProtocol = UserAPIDataManager()
        let localDataManager: UserLocalDataManagerInputProtocol = UserLocalDataManager()
        let router: UserRouterProtocol = UserRouter()

        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        interactor.localDatamanager = localDataManager

        return view as? UIViewController
    }
}
