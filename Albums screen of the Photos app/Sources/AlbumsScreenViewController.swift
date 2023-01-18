//
//  AlbumsScreenViewController.swift
//  Albums screen of the Photos app
//
//  Created by Kristina Korotkova on 12/01/23.
//

import UIKit

fileprivate enum Constants {
    static let title = "Albums"
    static let headerTitleLabelZero = "My Albums"
    static let headerTitleLabelOne = "Shared Albums"
    static let headerTitleLabelTwo = "Media Types"
    static let headerTitleLabelThree = "Utilities"
    static let headerDescriptionLabel = "See All"
}

fileprivate enum Constraits {
    // Constraits Header
    static let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                heightDimension: .estimated(50))
    // Constraits Section Zero
    static let itemSizeSectionZero = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1))
    static let layoutItemSectionZero = NSDirectionalEdgeInsets(top: 0,
                                                               leading: 0,
                                                               bottom: 20,
                                                               trailing: 10)
    static let groupSizeSectionZero = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.15),
                                                             heightDimension: .estimated(485))
    static let layoutSectionZero = NSDirectionalEdgeInsets(top: 0,
                                                           leading: 20,
                                                           bottom: 20,
                                                           trailing: 10)
    // Constraits Section One
    static let itemSizeSectionOne = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                           heightDimension: .fractionalHeight(1))
    static let layoutItemSectionOne = NSDirectionalEdgeInsets(top: 0,
                                                              leading: 0,
                                                              bottom: 20,
                                                              trailing: 10)

    static let groupSizeSectionOne = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.15),
                                                            heightDimension: .estimated(250))
    static let layoutSectionOne = NSDirectionalEdgeInsets(top: 0,
                                                          leading: 20,
                                                          bottom: 10,
                                                          trailing: 10)
    // Constraits Section Default
    static let itemSizeSectionDefault = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                               heightDimension: .fractionalHeight(1.0))
    static let groupSizeSectionDefault = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                heightDimension: .absolute(50))
    static let layoutSectionDefault = NSDirectionalEdgeInsets(top: 0,
                                                              leading: 20,
                                                              bottom: 30,
                                                              trailing: 10)
}

final class AlbumsScreenViewController: UIViewController {

    // MARK: Outlets

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(PhotoCell.self,
                                forCellWithReuseIdentifier: PhotoCell.identifier)
        collectionView.register(TableCell.self,
                                forCellWithReuseIdentifier: TableCell.identifier)
        collectionView.register(AlbumsCellHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: AlbumsCellHeader.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
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
        title = Constants.title
        navigationController?.navigationBar.prefersLargeTitles = true
        let button = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add,
                                     target: self, action: nil)
        navigationItem.leftBarButtonItem = button
    }

    private func setupHierarchy() {
        view.addSubview(collectionView)
    }

    private func setupLayout() {
        collectionView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(view)
        }
    }

    // MARK: - CollectionViewLayout

    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { section, _ in

            switch section {
            case 0:
                let itemSize = Constraits.itemSizeSectionZero
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = Constraits.layoutItemSectionZero

                let groupSize = Constraits.groupSizeSectionZero
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                                   subitem: layoutItem,
                                                                   count: 2)

                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = Constraits.layoutSectionZero
                layoutSection.orthogonalScrollingBehavior = .groupPaging

                let layoutSectionHeaderSize = Constraits.layoutSectionHeaderSize
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)

                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                return layoutSection
            case 1:
                let itemSize = Constraits.itemSizeSectionOne
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = Constraits.layoutItemSectionOne

                let groupSize = Constraits.groupSizeSectionOne
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                                     subitems: [layoutItem])

                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = Constraits.layoutSectionOne
                layoutSection.orthogonalScrollingBehavior = .continuous

                let layoutSectionHeaderSize = Constraits.layoutSectionHeaderSize
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)

                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                return layoutSection
            default:
                let itemSize = Constraits.itemSizeSectionDefault
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = Constraits.groupSizeSectionDefault
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                                     subitems: [layoutItem])

                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = Constraits.layoutSectionDefault

                let layoutSectionHeaderSize = Constraits.layoutSectionHeaderSize
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)

                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                return layoutSection
            }
        }
    }
}

// MARK: - Collection Setup

extension AlbumsScreenViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ModelForAlbums.model[section].count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return ModelForAlbums.model.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch indexPath.section {
        case 0, 1:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as? PhotoCell else { return UICollectionViewCell() }
            item.configuration(model: ModelForAlbums.model[indexPath.section][indexPath.item])
            return item
        default:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: TableCell.identifier, for: indexPath) as? TableCell else { return UICollectionViewCell() }
            item.configuration(model: ModelForAlbums.model[indexPath.section][indexPath.item])
            return item
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        switch indexPath.section {
        case 0:
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: AlbumsCellHeader.identifier,
                for: indexPath
            ) as? AlbumsCellHeader else { return UICollectionReusableView() }
            header.titleLabel.text = Constants.headerTitleLabelZero
            header.descriptionLabel.text = Constants.headerDescriptionLabel
            return header
        case 1:
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: AlbumsCellHeader.identifier,
                for: indexPath
            ) as? AlbumsCellHeader else { return UICollectionReusableView() }
            header.titleLabel.text = Constants.headerTitleLabelOne
            header.descriptionLabel.text = Constants.headerDescriptionLabel
            return header
        case 2:
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: AlbumsCellHeader.identifier,
                for: indexPath
            ) as? AlbumsCellHeader else { return UICollectionReusableView() }
            header.titleLabel.text = Constants.headerTitleLabelTwo
            return header
        default:
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: AlbumsCellHeader.identifier,
                for: indexPath
            ) as? AlbumsCellHeader  else { return UICollectionReusableView() }
            header.titleLabel.text = Constants.headerTitleLabelThree
            return header
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = ModelForAlbums.model[indexPath.section][indexPath.item]

        print("Нажата ячейка - \(model.title)")
    }
}
