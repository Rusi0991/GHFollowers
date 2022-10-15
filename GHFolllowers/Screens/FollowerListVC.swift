//
//  FollowerListVC.swift
//  GHFolllowers
//
//  Created by Ruslan Ismayilov on 10/3/22.
//

import UIKit

class FollowerListVC: UIViewController {
    
    enum Section {
    case main
    }
    
    var username : String!
    var followers : [Follower] = []
    
    var collectionView : UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    

    override func viewDidLoad() {
      
        super.viewDidLoad()
        configureCollectionView()
        configureViewController()
        getFollowers()
        configureDataSource()
        
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
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view) )
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseId)
    }
    
    
    func getFollowers(){
        NetworkManager.shared.getFollowers(for: username, page: 1) {[weak self] result in
            guard let self = self else {return}
            
            switch result{
            case .success(let followers) :
                self.followers = followers
                self.updateData()
                
            case.failure(let error) :
                self.presentGFAlertOnMAinThread(title: "Bad stuff happened", message: error.rawValue, buttonTitle: "OK")
            }
            
            
        }
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseId, for: indexPath) as! FollowerCell
            cell.set(follower: follower)
            return cell
        })
    }
    
    func updateData(){
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
       
    }
}
