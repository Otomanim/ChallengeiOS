//
//  DetailsViewController.swift
//  ChallengeiOS
//
//  Created by Evandro Rodrigo Minamoto on 14/05/24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var viewModel: DetailsViewModelProtocol?
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let detailsImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.layer.opacity = 1
        return image
    }()
    
    private let detailsDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let detailsContentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let separator: UIView = {
        let view = UIView()
        view.layer.opacity = 0
        return view
    }()
    
    private lazy var detailsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [detailsDateLabel, detailsContentLabel, separator])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        return stack
        
    }()
    
    init(viewModel: DetailsViewModelProtocol? = nil) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        clear()
        configureUI()
    }
    
    private func clear() {
        detailsDateLabel.text = nil
        detailsContentLabel.text = nil
        detailsImageView.image = nil
    }
    
    private func configureUI() {
        detailsDateLabel.text = viewModel?.detailsDateLabel
        detailsContentLabel.text = viewModel?.detailsContentLabel
        
        viewModel?.loadImage { [weak self] image in
            DispatchQueue.main.async {
                self?.detailsImageView.image = image ?? UIImage(named: "placeholder")
            }
        }
    }
    
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(detailsImageView)
        scrollView.addSubview(detailsStackView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            detailsImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 100),
            detailsImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            detailsImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            detailsImageView.heightAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1080.0/1920.0),
            detailsImageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            detailsStackView.topAnchor.constraint(equalTo: detailsImageView.bottomAnchor, constant: 20),
            detailsStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            detailsStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            detailsStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 10),
            detailsDateLabel.heightAnchor.constraint(equalTo: detailsStackView.heightAnchor, multiplier: 0.07),
            separator.heightAnchor.constraint(equalTo: detailsStackView.heightAnchor, multiplier: 0.5)
        ])
        
    }
}
