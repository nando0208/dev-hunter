//
// Created by Fernando Ferreira
// Copyright (c) 2018 Fernando Ferreira. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Protocols

// MARK: SearchPresenterProtocol
// VIEW -> PRESENTER
protocol SearchPresenterProtocol: class {

    // MARK: - Properties

    var view: SearchViewProtocol? { get set }
    var interactor: SearchInteractorInputProtocol? { get set }
    var router: SearchRouterProtocol? { get set }
}

// MARK: SearchViewProtocol
// PRESENTER -> VIEW
protocol SearchViewProtocol: class {

    // MARK: - Properties

    var presenter: SearchPresenterProtocol? { get set }
}

// MARK: SearchRouterProtocol
// PRESENTER -> ROUTER
protocol SearchRouterProtocol: class {

    // MARK: - Presentation

    static func presentSearchModule() -> UIViewController?
}

// MARK: SearchInteractorInputProtocol
// PRESENTER -> INTERACTOR
protocol SearchInteractorInputProtocol: class {

    // MARK: - Properties

    var presenter: SearchInteractorOutputProtocol? { get set }
    var APIDataManager: SearchAPIDataManagerInputProtocol? { get set }
    var localDatamanager: SearchLocalDataManagerInputProtocol? { get set }
}

// MARK: SearchInteractorOutputProtocol
// INTERACTOR -> PRESENTER
protocol SearchInteractorOutputProtocol: class { }

// MARK: SearchAPIDataManagerInputProtocol
// INTERACTOR -> APIDATAMANAGER
protocol SearchAPIDataManagerInputProtocol: class { }

// MARK: SearchLocalDataManagerInputProtocol
// INTERACTOR -> LOCALDATAMANAGER
protocol SearchLocalDataManagerInputProtocol: class { }
