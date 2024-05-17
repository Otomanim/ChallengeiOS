//
//  DetailsFactory.swift
//  ChallengeiOS
//
//  Created by Evandro Rodrigo Minamoto on 15/05/24.
//

import UIKit

enum DetailsFactory {
    static func makeModule(with article: Article) -> UIViewController {
        let service = NetworkService()
        let viewModel = DetailsViewModel(article: article, networkService: service)
        let viewController = DetailsViewController(viewModel: viewModel)
        return viewController
    }
}
