//
//  NetworkManager.swift
//  GHFolllowers
//
//  Created by Ruslan Ismayilov on 10/6/22.
//

import Foundation

class NetworkManager {
   static let shared  = NetworkManager()
    let baseUrl       = "https://api.github.com/users/"
    
    private init(){
        
    }
//    new way of complition handler
    func getFollowers(for username :String, page :Int, completed: @escaping(Result<[Follower], GFError>) -> Void){
        let endpoint = baseUrl + "\(username)/followers?per_page=100&page=\(page)"
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUserName))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error{
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                    completed(.failure(.invalidData))
                return
            }
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                        completed(.success(followers))
            }catch{
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
//    old way
//    func getFollowers(for username :String, page :Int, completed: @escaping([Follower?]?, ErrorMessage?) -> Void){
//        let endpoint = baseUrl + "\(username)/followers?per_page=100&page=\(page)"
//        guard let url = URL(string: endpoint) else {
//            completed(nil,.invalidUserName)
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let _ = error{
//                completed(nil, .unableToComplete)
//                return
//            }
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completed(nil, .invalidResponse)
//                return
//            }
//            guard let data = data else {
//                completed(nil, .invalidData)
//                return
//            }
//            do{
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let followers = try decoder.decode([Follower].self, from: data)
//                completed(followers, nil)
//            }catch{
//                completed(nil,.invalidData)
//            }
//        }
//        task.resume()
//    }
}