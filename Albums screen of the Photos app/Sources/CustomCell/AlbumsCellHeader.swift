//
//  AlbumsCellHeader.swift
//  Albums screen of the Photos app
//
//  Created by Kristina Korotkova on 13/01/23.
//

import UIKit

fileprivate enum Constants {
    static let identifier = "AlbumsCellHeader"
    static let error = "ERROR"
}

fileprivate enum Constraits {
    static let descriptionLabelRight = 10
    static let separatorViewRight = 10
    static let separatorViewHeight = 0.5
}

class AlbumsCellHeader: UICollectionReusableView {
    
    static let identifier = Constants.identifier
    
    // MARK: - Outlets

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.boldOfSize22
        return label
    }()

    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.regularOfSize16
        label.lineBreakMode = .byTruncatingTail
        label.textColor = Colors.systemBlue
        label.textAlignment = .right
        return label
    }()

    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.lightGray
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
            make.right.equalTo(self).offset(-Constraits.descriptionLabelRight)
            make.centerY.equalTo(self)
        }

        separatorView.snp.makeConstraints { make in
            make.left.equalTo(self)
            make.right.equalTo(self).offset(Constraits.separatorViewRight)
            make.top.equalTo(self)
            make.height.equalTo(Constraits.separatorViewHeight)
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        descriptionLabel.text = nil
    }
}
