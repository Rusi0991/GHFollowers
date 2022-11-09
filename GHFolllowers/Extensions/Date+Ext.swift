//
//  Date+Ext.swift
//  GHFolllowers
//
//  Created by Ruslan Ismayilov on 11/8/22.
//

import Foundation

extension Date{
    
    func convertToMonthYearFormat() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
        
    }
}
