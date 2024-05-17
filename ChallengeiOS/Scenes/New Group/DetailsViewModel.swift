//
//  DetailsViewModel.swift
//  ChallengeiOS
//
//  Created by Evandro Rodrigo Minamoto on 15/05/24.
//

import UIKit

protocol DetailsViewModelProtocol {
    var article: Article? { get set }
    var detailsDateLabel: String { get }
    var detailsContentLabel: String { get }
    
    func loadImage(completion: @escaping (UIImage?) -> Void)
}

class DetailsViewModel: DetailsViewModelProtocol {
    
    // MARK: - Properties
    var article: Article?
    var detailsDateLabel: String {
        guard let publishedDate = article?.publishedAt else {
            return ""
        }
        return formatarData(longDate: publishedDate) ?? ""
    }
    var detailsContentLabel: String {
        return article?.content ?? ""
    }
    
    private let networkService: NetworkServiceProtocol
    
    init(article: Article?, networkService: NetworkServiceProtocol) {
        self.article = article
        self.networkService = networkService
    }
    
    // MARK: - Public Methods
    func loadImage(completion: @escaping (UIImage?) -> Void) {
        guard let urlString = article?.urlToImage, let url = URL(string: urlString) else {
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
    
    // MARK: - Private Methods
    private func formatarData(longDate: String) -> String? {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withFullDate, .withTime, .withDashSeparatorInDate, .withColonSeparatorInTime]
        
        if let date = dateFormatter.date(from: longDate) {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "pt_BR")
            formatter.dateFormat = "dd 'de' MMMM 'de' yyyy 'às' HH:mm"
            
            return formatter.string(from: date)
        } else {
            return nil
        }
    }
}
