    //
//  Network.swift
//  Candidate-Miner
//
//  Created by Fernando Ferreira on 28/05/18.
//  Copyright © 2018 Fernando Ferreira. All rights reserved.
//

import Foundation
import Alamofire

final class Network {

    static func request<T: Decodable>(_ networkRequest: NetworkRequest, completion: @escaping (Result<T>) -> Void) {
        do {
            let urlRequest = try networkRequest.toRequest()
            Alamofire.request(urlRequest).response { response in
                if let error = response.error {
                    return completion(.failure(error))
                }

                guard let data = response.data else {
                    return completion(.failure(ResponseError.noData))
                }

                do {
                    let value = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(value))
                } catch let error {
                    completion(.failure(error))
                }
            }
        } catch let error {
            DispatchQueue.main.async { completion(.failure(error)) }
        }
    }
}

enum ResponseError: Error {
    case noData
}
