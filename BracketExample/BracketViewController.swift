//
//  ViewController.swift
//  BracketExample
//
//  Created by Kyle Watson on 5/26/20.
//  Copyright © 2020 Kyle Watson. All rights reserved.
//

import UIKit

class BracketViewController: UICollectionViewController {

    var dataSource: UICollectionViewDiffableDataSource<Int, Game>! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.collectionViewLayout = createLayout()
        collectionView.delegate = self

        collectionView.register(ConnectorView.self,
                                forSupplementaryViewOfKind: ConnectorView.elementKind1,
                                withReuseIdentifier: ConnectorView.reuseIdentifier)
        collectionView.register(ConnectorView.self,
                                forSupplementaryViewOfKind: ConnectorView.elementKind2,
                                withReuseIdentifier: ConnectorView.reuseIdentifier)
        collectionView.register(ConnectorView.self,
                                forSupplementaryViewOfKind: ConnectorView.elementKind3,
                                withReuseIdentifier: ConnectorView.reuseIdentifier)

        configureDatasource()
    }


    /* | COLUMN 1 |  | COLUMN 2 |  | COLUMN 3 |  | COLUMN 4 |
     +------------------------------------------------------------------------+
     | +----------+
     | |          |
     | |          |  +----------+
     | +----------+  |          |
     | +----------+  |          |
     | |          |  +----------+
     | |          |                +----------+
     | +----------+                |          |
     | +----------+                |          |
     | |          |                +----------+
     | |          |  +----------+
     | +----------+  |          |
     | +----------+  |          |
     | |          |  +----------+
     | |          |
     | +----------+
     |
     |  ...
     |
     +------------------------------------------------------------------------+
     |
     */
func createLayout() -> UICollectionViewLayout {
    let layout = UICollectionViewCompositionalLayout { (index, layoutEnvironment) in

        let connectorAnchor = NSCollectionLayoutAnchor(edges: [.trailing])
        let itemAnchor = NSCollectionLayoutAnchor(edges: [.leading])

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25),
                                               heightDimension: .fractionalHeight(1.0))

        // COLUMN 1
        let connector1 = NSCollectionLayoutSupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .absolute(25)),
            elementKind: ConnectorView.elementKind1,
            containerAnchor: connectorAnchor,
            itemAnchor: itemAnchor)

        let item1 = NSCollectionLayoutItem(layoutSize: itemSize, supplementaryItems: [connector1])
        item1.contentInsets = NSDirectionalEdgeInsets(top: 12.5, leading: 0, bottom: 12.5, trailing: 0)
        let column1 = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item1, count: 8)

        // COLUMN 2
        let connector2 = NSCollectionLayoutSupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .absolute(160)),
            elementKind: ConnectorView.elementKind2,
            containerAnchor: connectorAnchor,
            itemAnchor: itemAnchor)

        let item2 = NSCollectionLayoutItem(layoutSize: itemSize, supplementaryItems: [connector2])
        item2.contentInsets = NSDirectionalEdgeInsets(top: 80, leading: 0, bottom: 80, trailing: 0)
        let column2 = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item2, count: 4)

        // COLUMN 3
        let connector3 = NSCollectionLayoutSupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .absolute(430)),
            elementKind: ConnectorView.elementKind3,
            containerAnchor: connectorAnchor,
            itemAnchor: itemAnchor)

        let item3 = NSCollectionLayoutItem(layoutSize: itemSize, supplementaryItems: [connector3])
        item3.contentInsets = NSDirectionalEdgeInsets(top: 215, leading: 0, bottom: 215, trailing: 0)
        let column3 = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item3, count: 2)

        // COLUMN 4
        let item4 = NSCollectionLayoutItem(layoutSize: itemSize)
        item4.contentInsets = NSDirectionalEdgeInsets(top: 485, leading: -50, bottom: 485, trailing: 0)
        let column4 = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item4, count: 1)

        // Container
        let containerGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)),
            subitems: [column1, column2, column3, column4])

        print("CONTAINER: \n\(containerGroup.visualDescription())")
        let section = NSCollectionLayoutSection(group: containerGroup)

        return section
    }
    return layout
}

    func configureDatasource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) { (collectionView, indexPath, game) in
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "gameCell",
                for: indexPath) as? GameCell else {
                    fatalError()
            }

            cell.contentView.layer.borderColor = UIColor.black.cgColor
            cell.contentView.layer.borderWidth = 1
            cell.contentView.layer.cornerRadius = 8

//            print("indexPath: \(indexPath), game: \(game)")
            cell.configure(game: game)

            return cell
        }

        dataSource.supplementaryViewProvider = { [weak self] (collectionView, kind, indexPath) -> UICollectionReusableView? in
            print("supplementary provider, kind: \(kind), indexPath: \(indexPath)")
            guard let game = self?.dataSource.itemIdentifier(for: indexPath) else {
                return nil
            }

            if let connectorView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ConnectorView.reuseIdentifier, for: indexPath) as? ConnectorView {
                return connectorView
            } else {
                return nil
            }
        }

        var snapshot = NSDiffableDataSourceSnapshot<Int, Game>()
        snapshot.appendSections([0])
        snapshot.appendItems(allGames, toSection: 0)
        dataSource.apply(snapshot)
    }
}

