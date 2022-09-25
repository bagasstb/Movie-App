//
//  MovieViewController.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//  
//

import UIKit

class MovieViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: MoviePresenterProtocol?
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.getData()
    }
    
    // MARK: - Setup
    private func setupView() {
        setBackNavigationItem(title: presenter?.genreItemModel?.name ?? "Movie Genre", action: #selector(backPressed))
        setupCollectionView()
    }

    private func setupCollectionView() {
        movieCollectionView.register(MovieCollectionViewCell.nib(), forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
    }
    
    @objc private func backPressed() {
        presenter?.backPressed()
    }
}

// MARK: - View Protocol
extension MovieViewController: MovieViewProtocol {
    func reloadCollection() {
        movieCollectionView.reloadData()
    }
}

extension MovieViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.movieModel?.results?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else { return UICollectionViewCell() }
        let data = presenter?.movieModel?.results?[indexPath.row]
        cell.configure(title: data?.title, url: data?.posterPath)
        return cell
    }
    
}
