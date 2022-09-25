//
//  MainViewController.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//  
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var chooseGenreLabel: UILabel!
    @IBOutlet weak var genreCollectionView: UICollectionView!
    
    var presenter: MainPresenterProtocol?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.getData()
    }
    
    // MARK: - Setup
    private func setupView() {
        setupCollectionView()
        setMainNavigation(title: "Movie App")
        setupLabel()
    }

    private func setupCollectionView() {
        genreCollectionView.register(GenreCollectionViewCell.nib(), forCellWithReuseIdentifier: GenreCollectionViewCell.identifier)
        genreCollectionView.delegate = self
        genreCollectionView.dataSource = self
        genreCollectionView.collectionViewLayout = LeftAlignedCollectionViewFlowLayout()
    }
    
    private func setupLabel() {
        chooseGenreLabel.font = .fontAsset(font: .avenirMedium, size: 18)
    }
    
}

// MARK: - View Protocol
extension MainViewController: MainViewProtocol {
    func reloadCollection() {
        genreCollectionView.reloadData()
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.genreModel?.genres?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCollectionViewCell.identifier, for: indexPath) as? GenreCollectionViewCell else { return UICollectionViewCell() }
        
        let genre = presenter?.genreModel?.genres?[indexPath.row]
        cell.configure(with: genre?.name)
        
        return cell
    }
    
}
