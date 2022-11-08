//
//  GFRepoItemVC.swift
//  GHFolllowers
//
//  Created by Ruslan Ismayilov on 11/7/22.
//

import UIKit

class GFRepoItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    
    private func configureItems(){
        itemInfoOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "Github Profile")
        
    }
}
