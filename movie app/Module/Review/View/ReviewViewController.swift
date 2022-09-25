//
//  ReviewViewController.swift
//  movie app
//
//  Created by Satrio Teleng Bagaskoro on 25/09/22.
//  
//

import UIKit

class ReviewViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var reviewTableView: UITableView!
    @IBOutlet weak var reviewLabel: UILabel!
    
    var presenter: ReviewPresenterProtocol?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.getData()
    }
    
    // MARK: - Setup
    private func setupView() {
        setBackNavigationItem(title: presenter?.movieItemModel?.title ?? "Movie Review", action: #selector(backPressed))
        setupLabel()
        setupTableView()
    }

    private func setupLabel() {
        reviewLabel.font = .fontAsset(font: .avenirBlack, size: 20)
    }
    
    private func setupTableView() {
        reviewTableView.register(ReviewTableViewCell.nib(), forCellReuseIdentifier: ReviewTableViewCell.identifier)
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
    }
    
    @objc private func backPressed() {
        presenter?.backPressed()
    }
}

// MARK: - View Protocol
extension ReviewViewController: ReviewViewProtocol {
    func reloadTable() {
        reviewTableView.reloadData()
    }
}

extension ReviewViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.reviews.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReviewTableViewCell.identifier, for: indexPath) as? ReviewTableViewCell else { return UITableViewCell() }
        
        let data = presenter?.reviews[indexPath.row]
        
        cell.configure(author: data?.author, review: data?.content)
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // MARK: - Pagination
        let scrollOffset = scrollView.contentOffset.y + scrollView.frame.size.height
        
        if scrollOffset > scrollView.contentSize.height, presenter?.isLoadData == false {
            presenter?.isLoadData = true
            presenter?.loadMoreData()
        }
    }
    
}
