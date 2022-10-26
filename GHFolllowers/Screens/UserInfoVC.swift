//
//  UserInfoVC.swift
//  GHFolllowers
//
//  Created by Ruslan Ismayilov on 10/25/22.
//

import UIKit

class UserInfoVC: UIViewController {
    var username : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    print(username)
    }
    
    @objc func dismissVC(){
        dismiss(animated: true)
    }
   

}
