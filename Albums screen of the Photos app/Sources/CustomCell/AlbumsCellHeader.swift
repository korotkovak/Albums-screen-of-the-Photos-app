//
//  AlbumsCellHeader.swift
//  Albums screen of the Photos app
//
//  Created by Kristina Korotkova on 13/01/23.
//

import UIKit

class AlbumsCellHeader: UICollectionReusableView {
    
    static let identifier = "AlbumsCellHeader"
    
    // MARK: - Outlets

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 22, weight: .bold))
        return label
    }()

    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 16))
        label.lineBreakMode = .byTruncatingTail
        label.textColor = .systemBlue
        label.textAlignment = .right
        return label
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
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(separatorView)
    }

    private func setupLayout() {

        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(self)
            make.centerY.equalTo(self)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.right.equalTo(self).offset(-10)
            make.centerY.equalTo(self)
        }

        separatorView.snp.makeConstraints { make in
            make.left.equalTo(self)
            make.right.equalTo(self).offset(10)
            make.top.equalTo(self)
            make.height.equalTo(0.5)
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        descriptionLabel.text = nil
    }
}
