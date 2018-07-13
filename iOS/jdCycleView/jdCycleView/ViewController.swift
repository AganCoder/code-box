//
//  ViewController.swift
//  jdCycleView
//
//  Created by rs on 2018/7/13.
//  Copyright © 2018 rs. All rights reserved.
//

import UIKit

class PageFlowLayout: UICollectionViewFlowLayout {
    
    
    let offSet: CGFloat = 100
    
    var layoutAttributes: [UICollectionViewLayoutAttributes]?
    
    
    override func prepare() {
        super.prepare()
        
        guard let collection = self.collectionView else { return }
        
        layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        let rowItems = collection.numberOfItems(inSection: 0)
        
        let width = collection.bounds.width
        let height = collection.bounds.height
        
        let contentOffset = collection.contentOffset
        print(contentOffset.x / width)
        
        print("prepare")
//        let currentIndex = contentOffset / width
//        print(contentOffset)
        
        
        for i in 0..<rowItems {
            let attribute = UICollectionViewLayoutAttributes(forCellWith: IndexPath(row: i, section: 0))
            attribute.frame = CGRect(x: width * CGFloat(i), y: 0, width: width, height: height)
            attribute.zIndex = i
            
//            print(attribute.transform3D)
//            print(attribute.transform)
            
            
            layoutAttributes?.append(attribute)
        }
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        
        // 默认是 false
        let res = super.shouldInvalidateLayout(forBoundsChange: newBounds)
        return true
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        super.targetContentOffset(forProposedContentOffset: proposedContentOffset)
        print("proposedContentOffset: \(proposedContentOffset)")
        return proposedContentOffset
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        print("targetContentOffset: \(proposedContentOffset) --\(velocity)")
        return proposedContentOffset
    }
    
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        print("layoutAttributesForElements")
        var rectAttributes = [UICollectionViewLayoutAttributes]()
        
        for attribute in layoutAttributes ?? [] {
            if attribute.frame.intersects(rect) {
                rectAttributes.append(attribute)
            }
        }
        return rectAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return layoutAttributes?[indexPath.row]
    }
    
    
    override var collectionViewContentSize: CGSize {
        
        let maxItem = layoutAttributes?.max(by: { (item1, item2) -> Bool in
            return item1.frame.maxX <= item2.frame.maxX
        })
        return CGSize(width:  maxItem?.frame.maxX ?? 0, height: self.collectionView?.bounds.height ?? 0)
    }
}




class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: AnimatedCollectionViewLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let flowLayout = self.collectionView.collectionViewLayout as? AnimatedCollectionViewLayout else { return }
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.scrollDirection = .horizontal
        flowLayout.animator = ParallaxAttributesAnimator()
    }
}

extension ViewController: UICollectionViewDelegate {}


extension ViewController: UICollectionViewDelegateFlowLayout {

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath)
        
        let imageView = cell.viewWithTag(100) as? UIImageView                
        imageView?.image = UIImage(named: "\(indexPath.row + 1).jpg")
        return cell
    }
    
}



