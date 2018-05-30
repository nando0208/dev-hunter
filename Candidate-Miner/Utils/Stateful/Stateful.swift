//
//  Stateful.swift
//  Candidate-Miner
//
//  Created by Fernando Ferreira on 29/05/18.
//  Copyright © 2018 Fernando Ferreira. All rights reserved.
//

import Foundation
import UIKit

// Inspired from https://github.com/aschuch/StatefulViewController
enum StateMachine {
    case reconnecting
    case loading
    case content
    case error(EmptyFiller)
    case empty(EmptyFiller)
}

protocol Stateful {
    func adapt(toState state: StateMachine)
    func transition(toState state: StateMachine)
}

extension Stateful where Self: UIViewController {
    func transition(toState state: StateMachine) {
        adapt(toState: state)
    }
}
