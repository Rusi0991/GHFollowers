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
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { followers, errorMessage in
            guard let followers = followers else {
                self.presentGFAlertOnMAinThread(title: "Bad stuff happened", message: errorMessage!, buttonTitle: "OK")
                return
            }
            print("Followers.count = \(followers.count)")
            print(followers)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}
