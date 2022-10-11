//
//  FollowerListVC.swift
//  GHFolllowers
//
//  Created by Ruslan Ismayilov on 10/3/22.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username : String!
    var collectionView : UICollectionView!
    

    override func viewDidLoad() {
      
        super.viewDidLoad()
        configureCollectionView()
        configureViewController()
        getFollowers()
        
    }
        
        func configureViewController(){
            view.backgroundColor = .systemBackground
            navigationController?.navigationBar.prefersLargeTitles = true
        }
//   old way
//        NetworkManager.shared.getFollowers(for: username, page: 1) { followers, errorMessage in
//            guard let followers = followers else {
//                self.presentGFAlertOnMAinThread(title: "Bad stuff happened", message: errorMessage!.rawValue, buttonTitle: "OK")
//                return
//            }
//            print("Followers.count = \(followers.count)")
//            print(followers)
//        }
//
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func configureCollectionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemPink
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseId)
    }
    
    func getFollowers(){
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            
            switch result{
            case .success(let followers) :
                print(followers)
                
            case.failure(let error) :
                self.presentGFAlertOnMAinThread(title: "Bad stuff happened", message: error.rawValue, buttonTitle: "OK")
            }
            
            
        }
    }
    
    
}
