//
//  UserCell.swift
//  Candidate-Miner
//
//  Created by Fernando Ferreira on 01/06/18.
//  Copyright © 2018 Fernando Ferreira. All rights reserved.
//

import UIKit
import AlamofireImage

final class UserCell: UITableViewCell {
    @IBOutlet private weak var userPhoto: UIImageView?
    @IBOutlet private weak var userName: UILabel?
    @IBOutlet private weak var score: UILabel?
    @IBOutlet private weak var activity: UIActivityIndicatorView?

    var type: UserViewModel?

    private var imageRequest: RequestReceipt?

    override func prepareForReuse() {
        super.prepareForReuse()
        imageRequest?.request.cancel()
        imageRequest = nil
        userPhoto?.image = nil
    }
}

extension UserCell: Displayable {
    func configure(with display: UserViewModel) {
        userName?.text = display.userName
        score?.text = display.scoreValue

        if let url = display.photoURL {
            let filter = AspectScaledToFillSizeCircleFilter(size: userPhoto?.frame.size ?? .zero)
            let request = URLRequest(url: url)
            imageRequest = ImageDownloader.default.download(request, filter: filter) { [weak self] response in
                self?.activity?.stopAnimating()
                self?.userPhoto?.image = response.result.value
            }
        } else {
            activity?.stopAnimating()
        }
    }
}
