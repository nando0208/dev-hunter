//
//  NetworkRequest.swift
//  Candidate-Miner
//
//  Created by Fernando Ferreira on 28/05/18.
//  Copyright © 2018 Fernando Ferreira. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkRequest {
    var baseURL: URL? { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
    var parameters: Parameters? { get }
    var headers: HTTPHeaders? { get }
}

extension NetworkRequest {
    var headers: HTTPHeaders? { return .none}
    var baseURL: URL? { return URL(string: "http://localhost:8000") }

    func toRequest() throws -> URLRequestConvertible {
        guard let url = baseURL?.appendingPathComponent(path) else {
            throw NetworkRequestError.invalidURL
        }

        var urlRequest = try URLRequest(url: url, method: method, headers: HTTPHeaders())
        urlRequest.timeoutInterval = 15
        return try encoding.encode(urlRequest, with: parameters)
    }
}

enum NetworkRequestError: Error {
    case invalidURL
}
