//
//  ReviewTableViewCell.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLabel()
    }
    
    private func setupLabel() {
        authorLabel.font = .fontAsset(font: .avenirBlack, size: 16)
        reviewLabel.font = .fontAsset(font: .avenirLight, size: 16)
    }
    
    public func configure(author: String?, review: String?) {
        authorLabel.text = author
        reviewLabel.text = review
    }
    
}

extension ReviewTableViewCell: TableViewCellProtocol {
    
    static var identifier: String = "ReviewTableViewCell"
    
    static func nib() -> UINib {
        .init(nibName: identifier, bundle: nil)
    }
}
