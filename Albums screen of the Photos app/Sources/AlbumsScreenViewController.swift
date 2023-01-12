//
//  AlbumsScreenViewController.swift
//  Albums screen of the Photos app
//
//  Created by Kristina Korotkova on 12/01/23.
//

import UIKit

class AlbumsScreenViewController: UIViewController {

    // MARK: Outlets

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        //        collectionView.delegate = self
        //        collectionView.dataSource = self
        return collectionView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupView() {
        title = "Albums"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupHierarchy() {
        view.addSubview(collectionView)
    }

    private func setupLayout() {
        collectionView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(view)
        }
    }

    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { section, _ in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                                  heightDimension: .fractionalWidth(0.2))
            let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .fractionalHeight(1))
            let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: layoutItem, count: 5)

            let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
            return sectionLayout
        }
    }
}
