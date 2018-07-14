//
//  JungleCupCollectionViewController.swift
//  JungleCup
//
//  Created by enjoy on 2018/7/14.
//  Copyright © 2018 enjoy. All rights reserved.
//

import UIKit

class JungleCupCollectionViewController: UICollectionViewController {
    
    private let teams: [Team] = [Owls(), Giraffes(), Parrots(), Tigers()]
    private let sections = ["Goalkeeper", "Defenders", "Midfielders", "Forwards"]
    private var displayedTeam = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let collectionView = self.collectionView, let customLayout = collectionView.collectionViewLayout as? CustomLayout else { return }
        collectionView.register(
            UINib(nibName: "HeaderView", bundle: nil),
            forSupplementaryViewOfKind: CustomLayout.Element.header.rawValue,
            withReuseIdentifier: CustomLayout.Element.header.id
        )
        
        collectionView.register(
            UINib(nibName: "MenuView", bundle: nil),
            forSupplementaryViewOfKind: CustomLayout.Element.menu.rawValue,
            withReuseIdentifier: CustomLayout.Element.menu.id
        )
        
        customLayout.settings.itemSize = CGSize(width: collectionView.frame.width, height: 200)
        customLayout.settings.headerSize = CGSize(width: collectionView.frame.width, height: 300)
        customLayout.settings.menuSize = CGSize(width: collectionView.frame.width, height: 70)
        customLayout.settings.sectionHeaderSize = CGSize(width: collectionView.frame.width, height: 50)
        customLayout.settings.sectionFooterSize = CGSize(width: collectionView.frame.width, height: 50)
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

extension JungleCupCollectionViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams[displayedTeam].playerPictures[section].count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomLayout.Element.imageCell.id, for: indexPath)
        
        if let cell = cell as? PlayerCell {
            cell.picture.image = UIImage(named: teams[displayedTeam].playerPictures[indexPath.section][indexPath.row])
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomLayout.Element.sectionHeader.rawValue, for: indexPath)
            let titleLable = header.viewWithTag(100) as? UILabel
            titleLable?.text = sections[indexPath.section]
            
            return header
            
        case UICollectionElementKindSectionFooter:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomLayout.Element.sectionFooter.rawValue, for: indexPath)
            let titleLable = header.viewWithTag(100) as? UILabel
            titleLable?.text = sections[indexPath.section]
            
            return header
        case CustomLayout.Element.header.rawValue:
            let topHeaderView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: CustomLayout.Element.header.id,
                for: indexPath
            )
            return topHeaderView
            
        case CustomLayout.Element.menu.rawValue:
            let menuView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: CustomLayout.Element.menu.id,
                for: indexPath
            )
            return menuView
            
        default:
            fatalError("UnExcept element kind")
        }
    }
}

