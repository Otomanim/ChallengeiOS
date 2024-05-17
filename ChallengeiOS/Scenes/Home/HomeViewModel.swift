//
//  HomeViewModel.swift
//  ChallengeiOS
//
//  Created by Evandro Rodrigo Minamoto on 11/05/24.
//

import UIKit

protocol HomeViewModelProtocol: AnyObject {
    var delegate: HomeViewModelDelegate? { get set }
    
    func fetchData(for keyword: String)
    func configure(with cell: HomeCell, at indexPath: IndexPath)
    func getArticle(at index: Int) -> Article?
    func getHomeModel() -> [Article]
    func numberOfItems() -> Int
}

protocol HomeViewModelDelegate: AnyObject {
    func reloadData()
}

class HomeViewModel: HomeViewModelProtocol {
    
    // MARK: - Properties
    private var homeModel: [Article] = []
    private let networkService: NetworkServiceProtocol
    weak var delegate: HomeViewModelDelegate?
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    // MARK: - Public Methods
    func numberOfItems() -> Int {
        return homeModel.count
    }
    
    func getHomeModel() -> [Article] {
        return homeModel
    }

    func getArticle(at index: Int) -> Article? {
        guard index >= 0 && index < homeModel.count else {
            return nil
        }
        return homeModel[index]
    }

    func fetchData(for keyword: String) {
        networkService.getData(keyword: keyword) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let articles):
                self.homeModel = articles
                DispatchQueue.main.async {
                    self.delegate?.reloadData()
                }
            case .failure(let error):
                self.handleError(error)
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
        
        
        cell.titleLabel.text = article.title
        cell.descriptionLabel.text = article.description
        cell.authorLabel.text = article.author
        
        loadImage(from: article.urlToImage) { image in
            DispatchQueue.main.async {
                cell.imageViewUrl.image = image ?? UIImage(named: "placeholder")
            }
        }
    }
    
}

// MARK: - Private Methods
private extension HomeViewModel {

    func loadImage(from urlString: String?, completion: @escaping (UIImage?) -> Void) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        networkService.loadImage(from: url.absoluteString) { imageData in
            if let data = imageData, let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }
    }

    func handleError(_ error: Error) {
        // Handle error as needed
        print("Erro ao buscar dados: \(error)")
    }
}

