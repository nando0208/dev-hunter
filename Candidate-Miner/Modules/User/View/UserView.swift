//
// Created by Fernando Ferreira
// Copyright (c) 2018 Fernando Ferreira. All rights reserved.
//

import UIKit
import Alamofire
import Cartography

final class UserView: UIViewController {

    // MARK: - Outlets

    // MARK: - Properties

    let tableView = UITableView()
    let loadingView = UIActivityIndicatorView(frame: CGRect(x: 100.0, y: 100.0, width: 44.0, height: 44.0))
    let emptyView: EmptyView? = Bundle.main.loadNibNamed("EmptyView", owner: nil, options: nil)?.first as? EmptyView

    var presenter: UserPresenterProtocol?

    // MARK: - View's Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles =  false

        configureTableView()
        configureEmptyView()
        adjustContraints()

        presenter?.viewDidload()
    }

    // MARK: - Layout

    private func configureTableView() {
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "RepositoryCell", bundle: nil), forCellReuseIdentifier: "RepositoryCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 400.0
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        view.addSubview(tableView)

        loadingView.color = .gray
        loadingView.hidesWhenStopped = true
        tableView.addSubview(loadingView)

        constrain(tableView, loadingView) { tablePx, loadingPx in
            loadingPx.center == tablePx.center
        }
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

extension UserView: Stateful {
    func adapt(toState state: StateMachine) {
        switch state {
        case .content:
            emptyView?.isHidden = true
            loadingView.stopAnimating()
            tableView.reloadData()

        case .loading:
            emptyView?.isHidden = true
            tableView.reloadData()
            loadingView.startAnimating()

        case let .empty(filler), let .error(filler):
            emptyView?.fillEmptyState(filler)
            emptyView?.isHidden = false
        }
    }
}

// MARK: - UserViewProtocol

extension UserView: UserViewProtocol {

}

// MARK: - UITableViewDataSource

extension UserView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfCells() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?

        let repoCell = tableView.dequeueReusableCell(withIdentifier: "RepositoryCell", for: indexPath)
        if let repoCell = repoCell as? RepositoryCell {
            cell = repoCell
            presenter?.setContent(repoCell, at: indexPath)
        }

        return cell ?? UITableViewCell()
    }
}

// MARK: - EmptyViewDelegate

extension UserView: EmptyViewDelegate {
    func emptyButtonTouched() {
        //        presenter?.tryAgainTouched()
    }
}
