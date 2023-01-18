//
//  PhotoCell.swift
//  Albums screen of the Photos app
//
//  Created by Kristina Korotkova on 12/01/23.
//

import UIKit

fileprivate enum Constants {
    static let identifier = "PhotoCell"
    static let error = "ERROR"
    static let imageCornerRadius: CGFloat = 5
    static let imageSmallCornerRadius: CGFloat = 18
    static let imageSmallLayerborderWidthZero: CGFloat = 0
    static let imageSmallLayerborderWidthOne: CGFloat = 1
}

fileprivate enum Constraits {
    static let imageHeight = 180
    static let titleLabelTop = 5

    static let iconHeightWidth = 24
    static let iconLeft = 5
    static let iconBottom = 3

    static let imageSmallHeightWidth = 35
    static let imageSmallRightBottom = 7
}

final class PhotoCell: UICollectionViewCell {
    
    static let identifier = Constants.identifier

    // MARK: - Outlets

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.regularOfSize16
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.regularOfSize16
        label.lineBreakMode = .byTruncatingTail
        label.textColor = Colors.gray
        return label
    }()

    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = Constants.imageCornerRadius
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Colors.white
        return imageView
    }()

    private let imageSmall: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = Constants.imageSmallCornerRadius
        imageView.layer.borderColor = Colors.white.cgColor
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
        fatalError(Constants.error)
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
            make.height.equalTo(Constraits.imageHeight)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(Constraits.titleLabelTop)
            make.left.equalTo(contentView)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
        }

        icon.snp.makeConstraints { make in
            make.height.width.equalTo(Constraits.iconHeightWidth)
            make.left.equalTo(image).offset(Constraits.iconLeft)
            make.bottom.equalTo(image).offset(-Constraits.iconBottom)
        }

        imageSmall.snp.makeConstraints { make in
            make.height.width.equalTo(Constraits.imageSmallHeightWidth)
            make.right.bottom.equalTo(image).offset(-Constraits.imageSmallRightBottom)
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
            imageSmall.layer.borderWidth = Constants.imageSmallLayerborderWidthOne
        } else {
            imageSmall.layer.borderWidth = Constants.imageSmallLayerborderWidthZero
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
        imageSmall.image = nil
    }
}
