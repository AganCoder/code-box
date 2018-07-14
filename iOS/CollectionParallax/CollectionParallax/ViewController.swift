//
//  ViewController.swift
//  CollectionParallax
//
//  Created by rs on 2018/7/14.
//  Copyright © 2018 rs. All rights reserved.
//

import UIKit

final class ViewController: UICollectionViewController {
    
    
    let teams: [Team] = [Owls(), Giraffes(), Parrots(), Tigers()]
    
    private let sections = ["Goalkeeper", "Defenders", "Midfielders", "Forwards"]
    private var displayedTeam = 0
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionViewLayout()
    }
}

private extension ViewController {
    
    func setupCollectionViewLayout() {
//        guard let collectionView = collectionView, let customLayout = customLayout else { return }
        
//        collectionView.register(
//            UINib(nibName: "HeaderView", bundle: nil),
//            forSupplementaryViewOfKind: CustomLayout.Element.header.kind,
//            withReuseIdentifier: CustomLayout.Element.header.id
//        )
//
//        collectionView.register(
//            UINib(nibName: "MenuView", bundle: nil),
//            forSupplementaryViewOfKind: CustomLayout.Element.menu.kind,
//            withReuseIdentifier: CustomLayout.Element.menu.id
//        )
//
//        customLayout.settings.itemSize = CGSize(width: collectionView.frame.width, height: 200)
//        customLayout.settings.headerSize = CGSize(width: collectionView.frame.width, height: 300)
//        customLayout.settings.menuSize = CGSize(width: collectionView.frame.width, height: 70)
//        customLayout.settings.sectionsHeaderSize = CGSize(width: collectionView.frame.width, height: 50)
//        customLayout.settings.sectionsFooterSize = CGSize(width: collectionView.frame.width, height: 50)
//        customLayout.settings.isHeaderStretchy = true
//        customLayout.settings.isAlphaOnHeaderActive = true
//        customLayout.settings.headerOverlayMaxAlphaValue = CGFloat(0.6)
//        customLayout.settings.isMenuSticky = true
//        customLayout.settings.isSectionHeadersSticky = true
//        customLayout.settings.isParallaxOnCellsEnabled = true
//        customLayout.settings.maxParallaxOffset = 60
//        customLayout.settings.minimumInteritemSpacing = 0
//        customLayout.settings.minimumLineSpacing = 3
    }
}

//MARK: - UICollectionViewDataSource
extension ViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams[displayedTeam].playerPictures[section].count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomLayout.Element.cell.id, for: indexPath)
//        if let playerCell = cell as? PlayerCell {
//            playerCell.picture.image = UIImage(named: teams[displayedTeam].playerPictures[indexPath.section][indexPath.item])
//        }
//        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
//        case UICollectionElementKindSectionHeader:
//            let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomLayout.Element.sectionHeader.id, for: indexPath)
//            if let sectionHeaderView = supplementaryView as? SectionHeaderView {
//                sectionHeaderView.title.text = sections[indexPath.section]
//            }
//            return supplementaryView
//
//        case UICollectionElementKindSectionFooter:
//            let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomLayout.Element.sectionFooter.id, for: indexPath)
//            if let sectionFooterView = supplementaryView as? SectionFooterView {
//                sectionFooterView.mark.text = "Strength: \(teams[displayedTeam].marks[indexPath.section])"
//            }
//            return supplementaryView
//
//        case CustomLayout.Element.header.kind:
//            let topHeaderView = collectionView.dequeueReusableSupplementaryView(
//                ofKind: kind,
//                withReuseIdentifier: CustomLayout.Element.header.id,
//                for: indexPath
//            )
//            return topHeaderView
//
//        case CustomLayout.Element.menu.kind:
//            let menuView = collectionView.dequeueReusableSupplementaryView(
//                ofKind: kind,
//                withReuseIdentifier: CustomLayout.Element.menu.id,
//                for: indexPath
//            )
//            if let menuView = menuView as? MenuView {
//                menuView.delegate = self
//            }
//            return menuView
            
        default:
            fatalError("Unexpected element kind")
        }
    }
}

// MARK: - MenuViewDelegate
//extension JungleCupCollectionViewController: MenuViewDelegate {
//
//    func reloadCollectionViewDataWithTeamIndex(_ index: Int) {
//        displayedTeam = index
//        collectionView?.reloadData()
//    }
//}
