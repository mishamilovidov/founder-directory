//
//  Helpers.swift
//  Founder Directory
//
//  Created by Misha Milovidov on 10/2/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import Foundation
import UIKit

class Helpers {
    
    static func applyCircularMaskToImageView(image: UIImageView) {
        image.layer.masksToBounds = false
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
    }
    
    static func applyCircularMaskToButton(button: UIButton) {
        button.layer.cornerRadius = button.frame.height/2
        button.clipsToBounds = true
    }
    
    static func formatPhoneNumber(number: String) -> String {
        let cleanPhoneNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        var mask = "(XXX) XXX-XXXX"
        
        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask.characters {
            if index == cleanPhoneNumber.endIndex {
                break
            }
            if ch == "X" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    
    static func setFullName(firstName: String, lastName: String) -> String {
        var fullName: String
        
        fullName = "\(firstName) \(lastName)"
        
        return fullName
    }
    
}
