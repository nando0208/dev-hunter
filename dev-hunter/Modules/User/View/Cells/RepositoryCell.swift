//
//  RepositoryCell.swift
//  Candidate-Miner
//
//  Created by Fernando Ferreira on 03/06/18.
//  Copyright © 2018 Fernando Ferreira. All rights reserved.
//

import UIKit

final class RepositoryCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var dateLabel: UILabel?
    @IBOutlet weak var starsLabel: UILabel?

    var type: RepositoryViewModel?
}

extension RepositoryCell: Displayable {
    func configure(with display: RepositoryViewModel) {
        nameLabel?.text = display.name
        starsLabel?.text = display.starsCount
        dateLabel?.text = display.dateText
    }
}
