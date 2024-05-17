//
//  HomeFactory.swift
//  ChallengeiOS
//
//  Created by Evandro Rodrigo Minamoto on 11/05/24.
//

import UIKit

enum HomeFactory {
    static func makeModule() -> UIViewController {
        let service = NetworkService()
        let viewModel = HomeViewModel(networkService: service)
        let viewController = HomeViewController(homeViewModel: viewModel)
        viewModel.delegate = viewController
        return viewController
    }
}
