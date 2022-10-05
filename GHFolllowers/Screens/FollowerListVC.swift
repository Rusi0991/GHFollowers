//
//  FollowerListVC.swift
//  GHFolllowers
//
//  Created by Ruslan Ismayilov on 10/3/22.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}
