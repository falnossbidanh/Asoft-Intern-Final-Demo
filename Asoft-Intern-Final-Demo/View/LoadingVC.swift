//
//  LoadingVC.swift
//  Asoft-Intern-Final-Demo
//
//  Created by Danh Nguyen on 12/22/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit

class LoadingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let _ = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.load), userInfo: nil, repeats: false)
    }
    
    func load() {
        AppDelegate.shared.changeRootToStartCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
