//
// Created by Fernando Ferreira
// Copyright (c) 2018 Fernando Ferreira. All rights reserved.
//

import UIKit
import Alamofire

// MARK: - Protocols

// MARK: UserPresenterProtocol
// VIEW -> PRESENTER
protocol UserPresenterProtocol: class {

    // MARK: - Properties

    var view: (UserViewProtocol & Stateful)? { get set }
    var interactor: UserInteractorInputProtocol? { get set }
    var router: UserRouterProtocol? { get set }

    func viewDidload()

    func numberOfCells() -> Int
    func setContent<T>(_ view: T, at index: IndexPath) where T: Displayable
}

// MARK: UserViewProtocol
// PRESENTER -> VIEW
protocol UserViewProtocol: class {

    // MARK: - Properties

    var presenter: UserPresenterProtocol? { get set }
}

// MARK: UserRouterProtocol
// PRESENTER -> ROUTER
protocol UserRouterProtocol: class {

    // MARK: - Presentation

    static func presentUserModule(with user: User) -> UIViewController?
}

// MARK: UserInteractorInputProtocol
// PRESENTER -> INTERACTOR
protocol UserInteractorInputProtocol: class {

    // MARK: - Properties

    var presenter: UserInteractorOutputProtocol? { get set }
    var APIDataManager: UserAPIDataManagerInputProtocol? { get set }
    var localDatamanager: UserLocalDataManagerInputProtocol? { get set }

    func fetchRepositories()
    func numberOfRepositories() -> Int
    func repository(at index: Int) -> RepositoryViewModel?
}

// MARK: UserInteractorOutputProtocol
// INTERACTOR -> PRESENTER
protocol UserInteractorOutputProtocol: class {
    func finishedLoad(with error: Error?)
}

// MARK: UserAPIDataManagerInputProtocol
// INTERACTOR -> APIDATAMANAGER
protocol UserAPIDataManagerInputProtocol: class {
    func fetchRepositories(by userName: String, completion: @escaping (Result<[Repository]>) -> Void)
}

// MARK: UserLocalDataManagerInputProtocol
// INTERACTOR -> LOCALDATAMANAGER
protocol UserLocalDataManagerInputProtocol: class { }
