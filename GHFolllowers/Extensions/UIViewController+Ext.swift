//
//  UIViewController+Ext.swift
//  GHFolllowers
//
//  Created by Ruslan Ismayilov on 10/5/22.
//

import UIKit

extension UIViewController{
   func presentGFAlertOnMAinThread(title: String, message : String, buttonTitle : String){
       DispatchQueue.main.async {
           let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
           alertVC.modalPresentationStyle  = .overFullScreen
           alertVC.modalTransitionStyle    = .crossDissolve
           self.present(alertVC, animated: true)
       }
    }
}
