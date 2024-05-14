//
//  HomeViewModel.swift
//  ChallengeiOS
//
//  Created by Evandro Rodrigo Minamoto on 11/05/24.
//

import UIKit

protocol HomeViewModeling: AnyObject {
    func fechData(for keyword: String)
    func configure(with cell: HomeCell, at indexPath: IndexPath)
}

protocol HomeViewModelDelegate: AnyObject {
    func reloadData()
}

class HomeViewModel: HomeViewModeling {
    
    var homeModel: [Article] = []
    
    private let networkService: NetworkServicing
    
    weak var delegate: HomeViewModelDelegate?
    
    init(networkService: NetworkServicing) {
        self.networkService = networkService
    }
    
    func fechData(for keyword: String) {
        networkService.getData(keyword: keyword) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let articles):
                homeModel = articles
                DispatchQueue.main.async {
                    self.delegate?.reloadData()
                }
            case .failure(let error):
                print("Erro ao buscar dados: \(error)")
            }
        }
    }
    
    func configure(with cell: HomeCell, at indexPath: IndexPath) {
        guard indexPath.row < homeModel.count else {
            return
        }
        
        let article = homeModel[indexPath.row]
        
        guard let title = article.title,
              let description = article.description,
              let author = article.author,
              let imageUrl = article.urlToImage,
              let url = URL(string: imageUrl) else {
            return
        }
        
        cell.titleLabel.text = title
        cell.descriptionLabel.text = description
        cell.authorLabel.text = author
        
        networkService.loadImage(from: article.urlToImage) { imageData in
            DispatchQueue.main.async {
                if let data = imageData, let image = UIImage(data: data) {
                    cell.imageViewUrl.image = image
                } else {
                    cell.imageViewUrl.image = UIImage(named: "placeholder")
                }
            }
        }
    }
    
}
