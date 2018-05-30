//
// Created by Fernando Ferreira
// Copyright (c) 2018 Fernando Ferreira. All rights reserved.
//

import Foundation
import UIKit

final class SearchRouter: SearchRouterProtocol {

    // MARK: - Presenting

    static func presentSearchModule() -> UIViewController? {

        // Generating module components
        let view: (SearchViewProtocol & Stateful) = SearchView()
        let presenter: SearchPresenterProtocol & SearchInteractorOutputProtocol = SearchPresenter()
        let interactor: SearchInteractorInputProtocol = SearchInteractor()
        let APIDataManager: SearchAPIDataManagerInputProtocol = SearchAPIDataManager()
        let localDataManager: SearchLocalDataManagerInputProtocol = SearchLocalDataManager()
        let router: SearchRouterProtocol = SearchRouter()

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
