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
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        image.layer.opacity = 0.3
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 1
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
        contentView.addSubview(imageViewUrl)
        contentView.addSubview(containerStackView)
        
        NSLayoutConstraint.activate([
            imageViewUrl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageViewUrl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageViewUrl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            imageViewUrl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            imageViewUrl.heightAnchor.constraint(equalTo: imageViewUrl.widthAnchor),
            containerStackView.topAnchor.constraint(equalTo: imageViewUrl.topAnchor, constant: 15),
            containerStackView.leadingAnchor.constraint(equalTo: imageViewUrl.leadingAnchor, constant: 15),
            containerStackView.trailingAnchor.constraint(equalTo: imageViewUrl.trailingAnchor, constant: -15),
            containerStackView.bottomAnchor.constraint(equalTo: imageViewUrl.bottomAnchor, constant: -15),
            titleLabel.heightAnchor.constraint(equalTo: containerStackView.heightAnchor, multiplier: 0.3)
        ])
    }
    
}
