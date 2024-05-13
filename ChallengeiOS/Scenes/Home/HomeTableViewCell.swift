//
//  HomeTableViewCell.swift
//  ChallengeiOS
//
//  Created by Evandro Rodrigo Minamoto on 11/05/24.
//

import UIKit

class HomeCell: UITableViewCell {
    static var indentifier: String {
        String(describing: self)
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15)
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .italicSystemFont(ofSize: 12)
        label.textColor = .white
        return label
    }()
    
    let imageViewUrl: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
//        image.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        image.layer.opacity = 0.2
//        image.layer.borderColor = UIColor.white.cgColor
//        image.layer.borderWidth = 1
//        image.isHidden = true
        return image
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [descriptionLabel, authorLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
       
        return stack
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, labelsStackView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    private let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.isHidden = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        setupUI()
        clear()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func clear() {
        titleLabel.text = nil
        descriptionLabel.text = nil
        authorLabel.text = nil
        imageViewUrl.image = nil
    }
    
    private func setupUI() {
        contentView.addSubview(view)
        contentView.addSubview(imageViewUrl)
        contentView.addSubview(containerStackView)
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            view.heightAnchor.constraint(equalTo: view.widthAnchor),
            imageViewUrl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            imageViewUrl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageViewUrl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            imageViewUrl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            imageViewUrl.heightAnchor.constraint(equalTo: imageViewUrl.widthAnchor),
            containerStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            containerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            containerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            containerStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalTo: containerStackView.heightAnchor, multiplier: 0.3)
        ])
    }
    
}
