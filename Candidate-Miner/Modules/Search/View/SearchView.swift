//
// Created by Fernando Ferreira
// Copyright (c) 2018 Fernando Ferreira. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

final class SearchView: UIViewController {

    // MARK: - Outlets

    // MARK: - Properties

    var presenter: SearchPresenterProtocol?

    // MARK: - View's Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .magenta

        let request = GithubRequest.search(keyWord: "amor")
        Network.request(request) { (result: Result<SearchContainer>) in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    // MARK: - Actions
}

// MARK: - SearchViewProtocol

extension SearchView: SearchViewProtocol {

}
