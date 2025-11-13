//
//  FavoriteItemCell.swift
//  Favorita
//
//  Created by Perizat Muratova on 29.11.2025.
//

import UIKit

import UIKit

class FavoriteItemCell: UITableViewCell {
    
    // MARK: - UI Components
    
    let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.backgroundColor = UIColor.systemGray5
        imageView.tintColor = UIColor.systemBlue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 2
        label.textColor = UIColor.label
        label.translatesAutoresizingMaskIntoConstraints = false
        // Higher compression resistance so it doesn't shrink first
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 1
        label.textColor = UIColor.secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        return label
    }()
    
    let reviewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0 // Allow unlimited lines
        label.textColor = UIColor.label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return label
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setupConstraints()
    }
    
    // MARK: - Setup Methods
    
    private func setupViews() {
        contentView.addSubview(itemImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(reviewLabel)
        
        // Add some padding to the cell
        contentView.backgroundColor = UIColor.systemBackground
        backgroundColor = UIColor.systemBackground
        
        // Remove selection style for cleaner look
        selectionStyle = .none
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Image View Constraints
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            itemImageView.widthAnchor.constraint(equalToConstant: 80),
            itemImageView.heightAnchor.constraint(equalToConstant: 80),
            
            // Title Label Constraints
            titleLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            
            // Subtitle Label Constraints
            subtitleLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 12),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            
            // Review Label Constraints
            reviewLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 12),
            reviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            reviewLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 8),
            reviewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    // MARK: - Configuration
    
    func configure(with item: FavoriteItem) {
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        reviewLabel.text = item.review
        
        // Try to load image from Assets first, fallback to SF Symbol
        if let image = UIImage(named: item.imageName) {
            // Real image from Assets
            itemImageView.image = image
            itemImageView.contentMode = .scaleAspectFill
        } else if let symbolImage = UIImage(systemName: item.imageName) {
            // SF Symbol fallback
            itemImageView.image = symbolImage
            itemImageView.contentMode = .scaleAspectFit
        } else {
            // Default fallback
            itemImageView.image = UIImage(systemName: "photo")
            itemImageView.contentMode = .scaleAspectFit
        }
    }
    
    // MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        subtitleLabel.text = nil
        reviewLabel.text = nil
        itemImageView.image = nil
    }
}
