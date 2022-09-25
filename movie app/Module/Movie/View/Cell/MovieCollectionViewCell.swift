//
//  MovieCollectionViewCell.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        titleLabel.font = .fontAsset(font: .avenirMedium, size: 16)
    }

    public func configure(title: String?, url: String?) {
        titleLabel.text = title
        let url = URL(string: "https://image.tmdb.org/t/p/w500/" + (url ?? ""))
        coverImageView.kf.setImage(with: url)
    }
}

extension MovieCollectionViewCell: CollectionViewCellProtocol {
    
    static var identifier: String = "MovieCollectionViewCell"
    
    static func nib() -> UINib {
        return .init(nibName: identifier, bundle: nil)
    }
    
}
