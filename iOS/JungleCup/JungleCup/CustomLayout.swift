//
//  CustomLayout.swift
//  JungleCup
//
//  Created by enjoy on 2018/7/14.
//  Copyright © 2018 enjoy. All rights reserved.
//

import UIKit

class CustomLayoutAttributes: UICollectionViewLayoutAttributes {
    
}

struct CustomLayoutSettings {
    
    var itemSize: CGSize = .zero
    var headerSize: CGSize = .zero
    var menuSize: CGSize = .zero
    var sectionHeaderSize: CGSize = .zero
    var sectionFooterSize: CGSize = .zero

    
}

class CustomLayout: UICollectionViewFlowLayout {
    enum Element: String {
        case header
        case menu
        case sectionHeader
        case imageCell
        case sectionFooter
        
        var id: String { return self.rawValue }        
    }
    
    var settings = CustomLayoutSettings()
    
    private var contentHeight: CGFloat = 0
    private var attributes = [Element: [IndexPath: CustomLayoutAttributes]]()

    override var collectionViewContentSize: CGSize {
        return CGSize(width: collectionView?.frame.width ?? 0, height: contentHeight)
    }
    
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else { return }

        func prepareCache() {
            attributes.removeAll()
            attributes[.header] = [IndexPath: CustomLayoutAttributes]()
            attributes[.menu] = [IndexPath: CustomLayoutAttributes]()
            attributes[.sectionHeader] = [IndexPath: CustomLayoutAttributes]()
            attributes[.sectionFooter] = [IndexPath: CustomLayoutAttributes]()
            attributes[.imageCell] = [IndexPath: CustomLayoutAttributes]()
        }

        func prepareForElement(_ element: Element, size: CGSize, attribute: CustomLayoutAttributes) {

            attribute.frame = CGRect(origin: CGPoint(x: 0, y: contentHeight), size: size)

            contentHeight = attribute.frame.maxY
            attributes[element]?[attribute.indexPath] = attribute
        }

        prepareCache()
        contentHeight = 0

        let header = CustomLayoutAttributes(forSupplementaryViewOfKind: Element.header.id, with: IndexPath(row: 0, section: 0))
        prepareForElement(.header, size: settings.headerSize, attribute: header)
        
        let menu = CustomLayoutAttributes(forSupplementaryViewOfKind: Element.menu.id, with: IndexPath(row: 0, section: 0))
        prepareForElement(.menu, size: settings.menuSize, attribute: menu)


        for section in 0..<collectionView.numberOfSections {
            let sectionHeader = CustomLayoutAttributes(forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, with: IndexPath(item: 0, section: section))
            prepareForElement(.sectionHeader, size: settings.sectionHeaderSize, attribute: sectionHeader)

            for item in 0..<collectionView.numberOfItems(inSection: section) {
                let cellIndexPath = IndexPath(item: item, section: section)
                let attribute = CustomLayoutAttributes(forCellWith: cellIndexPath)

                attribute.frame = CGRect(x: 0, y: contentHeight, width: settings.itemSize.width, height: settings.itemSize.height)
                attribute.zIndex = item

                contentHeight = attribute.frame.maxY
                attributes[.imageCell]?[cellIndexPath] = attribute
            }

            let sectionFooter = CustomLayoutAttributes(forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, with: IndexPath(item: 1, section: section))
            prepareForElement(.sectionFooter, size: settings.sectionFooterSize, attribute: sectionFooter)
        }
    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = self.attributes.flatMap { (key, value) -> [CustomLayoutAttributes] in
            return value.map { $1 }
            }.filter { $0.frame.intersects(rect) }
        return attributes
    }


    override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        switch elementKind {
        case UICollectionElementKindSectionHeader:
            return self.attributes[Element.sectionHeader]?[indexPath]
        case UICollectionElementKindSectionFooter:
            return self.attributes[Element.sectionFooter]?[indexPath]
        case CustomLayout.Element.header.rawValue:
            return self.attributes[Element.header]?[indexPath]
        case Element.menu.rawValue:
            return self.attributes[.menu]?[indexPath]
        default: return nil
        }
    }
    
    
}
