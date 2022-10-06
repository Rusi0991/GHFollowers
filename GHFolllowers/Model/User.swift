//
//  User.swift
//  GHFolllowers
//
//  Created by Ruslan Ismayilov on 10/6/22.
//

import Foundation


struct User : Codable {
    var login : String
    var avatarUrl : String
    var name : String?
    var location : String?
    var bio : String?
    var publicRepo : Int
    var publicGist : Int
    var htmlUrl : String
    var following : Int
    var followers : Int
    var createdAt : String
    
}
