//
//  MovieDetailViewController.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//  
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var summaryTitleLabel: UILabel!
    @IBOutlet weak var voteValueLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    @IBOutlet weak var reviewButton: UIButton!
    @IBOutlet weak var backdropImageView: UIImageView!
    
    var presenter: MovieDetailPresenterProtocol?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.getData()
    }
    
    // MARK: - Setup
    private func setupView() {
        setBackNavigationItem(title: presenter?.movieItemModel?.title ?? "Movie Name", action: #selector(backPressed))
        setupLabel()
        setupButton()
    }

    private func setupLabel() {
        summaryTitleLabel.font = .fontAsset(font: .avenirBlack, size: 18)
        descriptionLabel.font = .fontAsset(font: .avenirMedium, size: 14)
        voteLabel.font = .fontAsset(font: .avenirBlack, size: 18)
        voteValueLabel.font = .fontAsset(font: .avenirMedium, size: 16)
    }
    
    private func setupButton() {
        reviewButton.makeCircleCorner()
        reviewButton.titleLabel?.font = .fontAsset(font: .avenirMedium, size: 14)
    }
    
    @objc private func backPressed() {
        presenter?.backPressed()
    }
    
    @IBAction func viewReviewPressed(_ sender: UIButton) {
        presenter?.reviewPressed()
    }
    
}

// MARK: - View Protocol
extension MovieDetailViewController: MovieDetailViewProtocol {
    func setData(with model: MovieItemModel) {
        let url = URL(string: "https://image.tmdb.org/t/p/w500/" + (model.backdropPath ?? ""))
        backdropImageView.kf.setImage(with: url)
        descriptionLabel.text = model.overview
        voteValueLabel.text = (model.voteAverage?.description ?? "0") + "/10 from " + (model.voteCount?.description ?? "0") + " vote count"
    }
}
