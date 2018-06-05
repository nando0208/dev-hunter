//
//  RepositoryViewModel.swift
//  Candidate-Miner
//
//  Created by Fernando Ferreira on 03/06/18.
//  Copyright © 2018 Fernando Ferreira. All rights reserved.
//

import Foundation

struct RepositoryViewModel {
    let repository: Repository

    init(repository: Repository) {
        self.repository = repository
    }

    var name: String? { return repository.name }
    var starsCount: String? { return String(repository.stars) }
    var dateText: String? {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        guard let date = format.date(from: repository.updatedDate) else { return "With out updated date" }

        format.dateFormat = "dd MMM, yyyy"
        return "Updated at \(format.string(from: date))"
    }
}
