//
//  CategoryDetailCollectionViewCell.swift
//  Asoft-Intern-Final-Demo
//
//  Created by Danh Nguyen on 1/3/17.
//  Copyright © 2017 Danh Nguyen. All rights reserved.
//

import UIKit

protocol PushViewController {
    func pushViewControlerWithIdentifierSegue(identifier: String, food: Food)
}

class CategoryDetailCollectionViewCell: UICollectionViewCell {
    
    //#MARK: - Outlet
    @IBOutlet weak var mainTableView: UITableView!
    
    //#MARK: - Define properties
    lazy internal var myContentOffsetY: CGFloat = 0.0
    var pushDelegate: PushViewController?
    var foods: [Food] = []
    
    //#MARK: - Set up
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainTableView.dataSource = self
        self.mainTableView.delegate = self
        self.mainTableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
}


//#MARK: - UITableView DataSource
extension CategoryDetailCollectionViewCell: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.kIdentifierCategoryCustomDetailTableViewCell, for: indexPath) as! CategoryDetailTableViewCell
    
        cell.selectionStyle = .none
        cell.containerView.clipsToBounds = true
        cell.containerView.layer.cornerRadius = 4
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowOffset = CGSize.zero
        cell.layer.shadowRadius = 1
        
        cell.mainImageView.image = UIImage(named: self.foods[indexPath.row].image)
        cell.nameLabel.text = self.foods[indexPath.row].name
        cell.timeLabel.text = "\(self.foods[indexPath.row].timeToPerform) min"
        
        return cell
    }
    
}


//#MARK: - UITableView Delegate
extension CategoryDetailCollectionViewCell: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let pushDelegate = self.pushDelegate {
            pushDelegate.pushViewControlerWithIdentifierSegue(identifier: AppSegueIdentifiers.kIdentifierSegueCategoryToRecipeChoosen, food: self.foods[indexPath.row])
        }
    }
    
}


//#MARK: - UIScrollView Delegate
extension CategoryDetailCollectionViewCell {
    

    
}










