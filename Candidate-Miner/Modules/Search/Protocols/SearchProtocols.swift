//
// Created by Fernando Ferreira
// Copyright (c) 2018 Fernando Ferreira. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

// MARK: - Protocols

// MARK: SearchPresenterProtocol
// VIEW -> PRESENTER
protocol SearchPresenterProtocol: class {

    // MARK: - Properties

    var view: (SearchViewProtocol & Stateful)? { get set }
    var interactor: SearchInteractorInputProtocol? { get set }
    var router: SearchRouterProtocol? { get set }

    func viewDidload()
    func touchedSearch(with key: String)
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

    func searchUsers(by keyWord: String)
    func user(at index: Int) -> UserViewModel?
}

// MARK: SearchInteractorOutputProtocol
// INTERACTOR -> PRESENTER
protocol SearchInteractorOutputProtocol: class {
    func finishedSearch(with error: Error?)
}

// MARK: SearchAPIDataManagerInputProtocol
// INTERACTOR -> APIDATAMANAGER
protocol SearchAPIDataManagerInputProtocol: class {
    func fetchUsers(by key: String, completion: @escaping (Result<SearchContainer>) -> Void)
}

// MARK: SearchLocalDataManagerInputProtocol
// INTERACTOR -> LOCALDATAMANAGER
protocol SearchLocalDataManagerInputProtocol: class { }
