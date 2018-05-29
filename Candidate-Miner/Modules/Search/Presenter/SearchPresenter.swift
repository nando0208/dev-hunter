//
// Created by Fernando Ferreira
// Copyright (c) 2018 Fernando Ferreira. All rights reserved.
//

import Foundation

final class SearchPresenter: SearchPresenterProtocol {

    // MARK: - Properties

    weak var view: SearchViewProtocol?
    var interactor: SearchInteractorInputProtocol?
    var router: SearchRouterProtocol?

    // MARK: Initialization

    init() {}
}

// MARK: - SearchInteractorOutputProtocol

extension SearchPresenter: SearchInteractorOutputProtocol {

}
