//
//  Displayable.swift
//  Candidate-Miner
//
//  Created by Fernando Ferreira on 01/06/18.
//  Copyright © 2018 Fernando Ferreira. All rights reserved.
//

import Foundation

protocol Displayable {
    associatedtype DisplayType
    var type: DisplayType? { get }
    func configure(with display: DisplayType)
}
