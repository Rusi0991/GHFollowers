//
//  ErrorMessage.swift
//  GHFolllowers
//
//  Created by Ruslan Ismayilov on 10/6/22.
//

import Foundation

enum ErrorMessage : String {
    case invalidUserName  = "This username created an invalid request. Please try again."
    case unableToComplete  = "Unable to complete your request. Please check you internet connection."
    case invalidResponse  = "Invalid response from the server. Please ttry again."
    case invalidData      = "The data received from the server was invalid. Please try again."
    
}
