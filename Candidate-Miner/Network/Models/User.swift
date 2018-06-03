//
//  User.swift
//  Candidate-Miner
//
//  Created by Fernando Ferreira on 29/05/18.
//  Copyright © 2018 Fernando Ferreira. All rights reserved.
//

import Foundation

struct SearchContainer: Decodable {
    let count: Int
    let users: [User]

    enum CodingKeys: String, CodingKey {
        case count = "total_count"
        case users = "items"
    }
}

struct User: Decodable {
    let userName: String
    let userID: Int
    let photoURL: String
    let score: Double

    enum CodingKeys: String, CodingKey {
        case userName = "login"
        case userID = "id"
        case photoURL = "avatar_url"
        case score = "score"
    }
}

/*
 login: "nando0208",
 id: 6474128,
 avatar_url: "https://avatars3.githubusercontent.com/u/6474128?v=4",
 gravatar_id: "",
 url: "https://api.github.com/users/nando0208",
 html_url: "https://github.com/nando0208",
 followers_url: "https://api.github.com/users/nando0208/followers",
 following_url: "https://api.github.com/users/nando0208/following{/other_user}",
 gists_url: "https://api.github.com/users/nando0208/gists{/gist_id}",
 starred_url: "https://api.github.com/users/nando0208/starred{/owner}{/repo}",
 subscriptions_url: "https://api.github.com/users/nando0208/subscriptions",
 organizations_url: "https://api.github.com/users/nando0208/orgs",
 repos_url: "https://api.github.com/users/nando0208/repos",
 events_url: "https://api.github.com/users/nando0208/events{/privacy}",
 received_events_url: "https://api.github.com/users/nando0208/received_events",
 type: "User",
 site_admin: false,
 score: 66.52439
 */
