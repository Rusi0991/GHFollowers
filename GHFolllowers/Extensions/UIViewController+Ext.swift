//
//  UIViewController+Ext.swift
//  GHFolllowers
//
//  Created by Ruslan Ismayilov on 10/5/22.
//

import UIKit
fileprivate var containerView : UIView!

extension UIViewController{
   func presentGFAlertOnMAinThread(title: String, message : String, buttonTitle : String){
       DispatchQueue.main.async {
           let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
           alertVC.modalPresentationStyle  = .overFullScreen
           alertVC.modalTransitionStyle    = .crossDissolve
           self.present(alertVC, animated: true)
       }
    }
    
    func showLoadingView(){
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        containerView.backgroundColor  = .systemBackground
        containerView.alpha            = 0
        
        UIView.animate(withDuration: 0.25) {
            containerView.alpha = 0.8
            
            let activityIndicator = UIActivityIndicatorView(style: .large)
            containerView.addSubview(activityIndicator)
            
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            ])
            activityIndicator.startAnimating()
        }
        
    }
    
    func dismissLoadingView(){
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
       
    }
}
