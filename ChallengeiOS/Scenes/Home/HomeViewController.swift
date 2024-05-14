//
//  ViewController.swift
//  ChallengeiOS
//
//  Created by Evandro Rodrigo Minamoto on 11/05/24.
//

import UIKit

class HomeViewController: UIViewController, HomeViewModelDelegate {
    
    private let homeViewModel: HomeViewModel
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Pesquisar"
        searchBar.searchTextField.textColor = .white
        searchBar.overrideUserInterfaceStyle = .dark
        searchBar.delegate = self
        return searchBar
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .black
        tableView.register(HomeCell.self, forCellReuseIdentifier: HomeCell.indentifier)
        return tableView
    }()
    
    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
        super.init(nibName: nil, bundle: nil)
        self.homeViewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        setupUi()
        
    }
    
    func reloadData() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    private func setupUi() {
        view.addSubview(tableView)
        
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let validArticles = homeViewModel.homeModel.filter { article in
            return article.title != nil &&
            article.description != nil &&
            article.author != nil &&
            article.urlToImage != nil
        }
        
        return validArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.indentifier) as? HomeCell else {
            return UITableViewCell()
        }
        if homeViewModel.homeModel.isEmpty {
            cell.titleLabel.text = nil
            cell.authorLabel.text = nil
            cell.descriptionLabel.text = nil
            cell.imageViewUrl.image = nil
        } else {
            homeViewModel.configure(with: cell, at: indexPath)
        }
        
        return cell
    }
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {return}
        homeViewModel.fechData(for: searchText)
    }
}
