//
//  UserViewModel.swift
//  Candidate-Miner
//
//  Created by Fernando Ferreira on 29/05/18.
//  Copyright © 2018 Fernando Ferreira. All rights reserved.
//

import Foundation

struct UserViewModel {
    private let user: User

    init(user: User) {
        self.user = user
    }

    var userName: String { return user.userName }
    var photoURL: URL? { return URL(string: user.photoURL) }
    var scoreValue: String? { return String(user.score) }
}
