//
//  CombineView.swift
//  Asoft-Intern-Final-Demo
//
//  Created by Danh Nguyen on 12/24/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit

class CombineView: UIView {

    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var footerMenu: UIView!
    @IBOutlet weak var detailCollectionView: UICollectionView!
    
    var selectedCell: Int = 0
    var menu = ["IMAGES", "NAMES"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
   

}


//#MARK: UICollectionView DataSource
extension CombineView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case menuCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.kIdentifierCombineMenuViewCell, for: indexPath) as! MenuCollectionCell
            
            if indexPath.row == selectedCell {
                cell.textLabel.textColor = UIColor.black
                UIView.animate(withDuration: 0.2, animations: {
                    self.footerMenu.frame.origin.x = cell.frame.origin.x
                })
            } else {
                if let color = AppDelegate.shared.mainColor {
                    cell.textLabel.textColor = color
                }
            }
            cell.textLabel.text = menu[indexPath.row]
            
            return cell
        default:
            switch indexPath.row {
            case 0:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.kIdentifierImageCollectionViewCell, for: indexPath)
                
                
                return cell
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.kIdentifierNameCollectionViewCell, for: indexPath)
                
                
                return cell
            }
        }
        
    }
    
}


//#MARK: UICollectionView Delegate
extension CombineView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case menuCollectionView:
            self.selectedCell = indexPath.row
            self.menuCollectionView.reloadData()
            UIView.animate(withDuration: 0.3, animations: {
                self.detailCollectionView.contentOffset.x = self.detailCollectionView.bounds.width*CGFloat(self.selectedCell)
            })
        default:
            break
        }
    }
    
}


//#MARK: - UICollectionView Delegate FlowLayout
extension CombineView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case menuCollectionView:
            return CGSize(width: collectionView.bounds.width/2, height: collectionView.bounds.height-3)
        default:
            return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}


//#MARK: - Scroll View Delegate
extension CombineView {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if self.detailCollectionView.isTracking {
//            self.footerMenu.frame.origin.x = self.detailCollectionView.contentOffset.x
//        }
        self.footerMenu.frame.origin.x = self.detailCollectionView.contentOffset.x/2
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.selectedCell = Int(scrollView.contentOffset.x / self.detailCollectionView.bounds.width)
        self.menuCollectionView.reloadData()
    }
    
}



