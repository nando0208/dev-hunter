//
// Created by Fernando Ferreira
// Copyright (c) 2018 Fernando Ferreira. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import Cartography

final class SearchView: UIViewController {

    // MARK: - Properties

    let tableView = UITableView()
    let loadingView = UIActivityIndicatorView()
    let emptyView: EmptyView? = Bundle.main.loadNibNamed("EmptyView", owner: nil, options: nil)?.first as? EmptyView

    var presenter: SearchPresenterProtocol?

    private let searchHeight: CGFloat = 34.0

    // MARK: - View's Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        configureTableView()
        configureSearchBar()
        configureEmptyView()
        adjustContraints()

        presenter?.viewDidload()
    }

    // MARK: - Layout

    private func configureTableView() {
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 400.0
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        view.addSubview(tableView)

        loadingView.hidesWhenStopped = true
        tableView.addSubview(loadingView)

        constrain(tableView, loadingView) { tablePx, loadingPx in
            loadingPx.center == tablePx.center
        }
    }

    private func configureSearchBar() {
        title = "Usuários"
        navigationController?.navigationBar.prefersLargeTitles =  true

        let search = UISearchController(searchResultsController: nil)
        search.searchBar.delegate = self
        navigationItem.searchController = search
    }

    private func configureEmptyView() {
        guard let emptyView = emptyView else { return }
        emptyView.delegate = self
        view.addSubview(emptyView)
        constrain(tableView, emptyView) { tablePx, emptyPx in
            emptyPx.edges == tablePx.edges
        }
    }

    private func adjustContraints() {
        constrain(view, tableView) { viewPx, tablePx in
            tablePx.edges == viewPx.safeAreaLayoutGuide.edges
        }
    }

    // MARK: - Actions
}

// MARK: - Stateful

extension SearchView: Stateful {
    func adapt(toState state: StateMachine) {
        switch state {
        case .content:
            emptyView?.isHidden = true
            loadingView.stopAnimating()
            navigationItem.hidesSearchBarWhenScrolling = true
            navigationItem.searchController?.isActive = false
            tableView.reloadData()

        case .loading:
            emptyView?.isHidden = true
            tableView.reloadData()
            loadingView.startAnimating()

        case let .empty(filler), let .error(filler):
            emptyView?.fillEmptyState(filler)
            emptyView?.isHidden = false
            navigationItem.hidesSearchBarWhenScrolling = false
        }
    }
}

// MARK: - FilterViewProtocol

extension SearchView: SearchViewProtocol {}

// MARK: - UITableViewDataSource

extension SearchView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfCells() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()

        if let userCell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell {
            cell = userCell
            presenter?.setContent(userCell, at: indexPath)
        }

        return cell
    }
}

extension SearchView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectedCell(at: indexPath)
    }
}

// MARK: - UITextfieldDelegate

extension SearchView: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        presenter?.touchedSearch(with: text)
    }
}

// MARK: - EmptyViewDelegate

extension SearchView: EmptyViewDelegate {
    func emptyButtonTouched() {
//        presenter?.tryAgainTouched()
    }
}
