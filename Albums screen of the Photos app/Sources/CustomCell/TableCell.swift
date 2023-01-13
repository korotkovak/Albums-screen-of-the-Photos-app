//
//  TableCell.swift
//  Albums screen of the Photos app
//
//  Created by Kristina Korotkova on 12/01/23.
//

import UIKit

fileprivate enum Constants {
    static let identifier = "TableCell"
    static let error = "ERROR"
    static let chevronImage = UIImage(systemName: "chevron.right")
    static let raw = "RAW"
    static let recentlyDeleted = "Recently Deleted"
}

fileprivate enum Constraits {
    static let imageHeightWidth = 26
    static let titleLabelLeft = 16

    static let accessoryImageViewRight = 10
    static let accessoryImageViewWidth = 10
    static let accessoryImageViewHeight = 16

    static let iconHeightWidth = 16
    static let iconRight = 18

    static let descriptionLabelRight = 18

    static let separatorViewLeft = 43
    static let separatorViewRight = 10
    static let separatorViewHeight = 0.5
}

class TableCell: UICollectionViewCell {

    static let identifier = Constants.identifier

    // MARK: - Outlets

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.regularOfSize22
        label.textColor = Colors.systemBlue
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.regularOfSize16
        label.textColor = Colors.gray
        return label
    }()

    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Colors.systemBlue
        return imageView
    }()

    private let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Colors.gray
        return imageView
    }()

    private let accessoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.chevronImage
        imageView.tintColor = Colors.grayWithAlphaComponent
        return imageView
    }()

    private lazy var separatorView: UIView = {
        let view = UIView()
        return view
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHeirarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError(Constants.error)
    }

    // MARK: - Setup

    private func setupHeirarchy() {
        contentView.addSubview(image)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(separatorView)
        contentView.addSubview(accessoryImageView)
        contentView.addSubview(icon)
    }

    private func setupLayout() {
        image.snp.makeConstraints { make in
            make.height.width.equalTo(Constraits.imageHeightWidth)
            make.centerY.equalTo(contentView)
        }

        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(image.snp.right).offset(Constraits.titleLabelLeft)
            make.centerY.equalTo(image)
        }

        accessoryImageView.snp.makeConstraints { make in
            make.right.equalTo(contentView).offset(-Constraits.accessoryImageViewRight)
            make.centerY.equalTo(image)
            make.width.equalTo(Constraits.accessoryImageViewWidth)
            make.height.equalTo(Constraits.accessoryImageViewHeight)
        }

        icon.snp.makeConstraints { make in
            make.right.equalTo(accessoryImageView.snp.right).offset(-Constraits.iconRight)
            make.centerY.equalTo(image)
            make.width.height.equalTo(Constraits.iconHeightWidth)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.right.equalTo(accessoryImageView.snp.right).offset(-Constraits.descriptionLabelRight)
            make.centerY.equalTo(image)
        }

        separatorView.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(Constraits.separatorViewLeft)
            make.right.equalTo(contentView).offset(Constraits.separatorViewRight)
            make.bottom.equalTo(contentView)
            make.height.equalTo(Constraits.separatorViewHeight)
        }
    }

    // MARK: - Configuration

    func configuration(model: Model) {
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        self.image.image = UIImage(systemName: model.image ?? "")
        icon.image = UIImage(systemName: model.icon ?? "")

        if model.title == Constants.raw || model.title == Constants.recentlyDeleted {
            separatorView.backgroundColor = Colors.white
        } else {
            separatorView.backgroundColor = Colors.lightGray
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
    }
}
