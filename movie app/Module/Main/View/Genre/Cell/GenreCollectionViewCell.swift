//
//  GenreCollectionViewCell.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var genreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.makeCardCorner()
        containerView.makeCardShadow()
    }
    
    private func setupView() {
        genreLabel.font = .fontAsset(font: .avenirMedium, size: 14)
        genreLabel.backgroundColor = .white
        containerView.backgroundColor = .white
    }
    
    public func configure(with genre: String?) {
        genreLabel.text = genre
    }

}

extension GenreCollectionViewCell: CollectionViewCellProtocol {
    
    static var identifier: String = "GenreCollectionViewCell"
    
    static func nib() -> UINib {
        return .init(nibName: identifier, bundle: nil)
    }
    
}
