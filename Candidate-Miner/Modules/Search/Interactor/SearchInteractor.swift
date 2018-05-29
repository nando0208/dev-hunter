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

    // MARK: - Initialization

    init() {}

}
