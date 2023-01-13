//
//  TableCell.swift
//  Albums screen of the Photos app
//
//  Created by Kristina Korotkova on 12/01/23.
//

import UIKit

class TableCell: UICollectionViewCell {

    static let identifier = "TableCell"

    // MARK: - Outlets

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 20))
        label.textColor = .systemBlue
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
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemBlue
        return imageView
    }()

    private let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .gray
        return imageView
    }()

    private let accessoryImageView: UIImageView = {
        let chevronImage = UIImage(systemName: "chevron.right")
        let imageView = UIImageView()
        imageView.image = chevronImage
        imageView.tintColor = .gray.withAlphaComponent(0.7)
        return imageView
    }()

    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHeirarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("ERROR")
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
            make.height.width.equalTo(26)
            make.centerY.equalTo(contentView)
        }

        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(image.snp.right).offset(16)
            make.centerY.equalTo(image)
        }

        accessoryImageView.snp.makeConstraints { make in
            make.right.equalTo(contentView).offset(-10)
            make.centerY.equalTo(image)
            make.width.equalTo(10)
            make.height.equalTo(16)
        }

        icon.snp.makeConstraints { make in
            make.right.equalTo(accessoryImageView.snp.right).offset(-18)
            make.centerY.equalTo(image)
            make.width.height.equalTo(16)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.right.equalTo(accessoryImageView.snp.right).offset(-18)
            make.centerY.equalTo(image)
        }

        separatorView.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(43)
            make.right.equalTo(contentView).offset(10)
            make.bottom.equalTo(contentView)
            make.height.equalTo(0.5)
        }
    }

    // MARK: - Configuration

    func configuration(model: Model) {
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        self.image.image = UIImage(systemName: model.image ?? "")
        icon.image = UIImage(systemName: model.icon ?? "")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
    }
}
