//
//  PhotoCell.swift
//  Albums screen of the Photos app
//
//  Created by Kristina Korotkova on 12/01/23.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    static let identifier = "PhotoCell"

    // MARK: - Outlets

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 16))
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 16))
        label.textColor = .gray
        return label
    }()

    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        return imageView
    }()

    private let imageSmall: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 18
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()

    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("ERROR")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        contentView.addSubview(image)
        contentView.addSubview(icon)
        contentView.addSubview(imageSmall)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
    }

    private func setupLayout() {

        image.snp.makeConstraints { make in
            make.left.top.right.equalTo(contentView)
            make.height.equalTo(180)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(5)
            make.left.equalTo(contentView)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalTo(contentView)
        }

        icon.snp.makeConstraints { make in
            make.height.width.equalTo(24)
            make.left.equalTo(image).offset(5)
            make.bottom.equalTo(image).offset(-3)
        }

        imageSmall.snp.makeConstraints { make in
            make.height.width.equalTo(35)
            make.right.equalTo(image).offset(-5)
            make.bottom.equalTo(image).offset(-5)
        }
    }

    // MARK: - Configuration

    func configuration(model: Model) {
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        self.image.image = UIImage(named: model.image ?? "")
        icon.image = UIImage(systemName: model.icon ?? "")
        imageSmall.image = UIImage(named: model.imageSmall ?? "")

        configurationBorderImageSmall()
    }

    func configurationBorderImageSmall() {
        if imageSmall.image != nil {
            imageSmall.layer.borderWidth = 1
        } else {
            imageSmall.layer.borderWidth = 0
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
    }
}
