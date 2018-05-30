//
//  ArrayExtensions.swift
//  Candidate-Miner
//
//  Created by Fernando Ferreira on 29/05/18.
//  Copyright © 2018 Fernando Ferreira. All rights reserved.
//

import Foundation

// MARK: Get a safe element from collection without hit out of index
extension Collection {
    func get(_ index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
