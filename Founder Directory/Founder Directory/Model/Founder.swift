//
//  Founder.swift
//  Founder Directory
//
//  Created by Misha Milovidov on 9/29/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import Foundation

class Founder {
    
    // MARK: - Properties
    
    var firstName: String
    var lastName: String
    var preferredName: String
    var fullName: String
    var spouseName: String
    var phone: String
    var email: String
    var company: String
    var bio: String
    var photo: String
    var phoneListed: Bool
    var emailListed: Bool
    
    // MARK: - Initialization
    
    init(firstName: String, lastName: String, preferredName: String, fullName: String, spouseName: String, phone: String, email: String, company: String, bio: String, photo: String, phoneListed: Bool, emailListed: Bool) {
        self.firstName = firstName
        self.lastName = lastName
        self.preferredName = preferredName
        self.fullName = fullName
        self.spouseName = spouseName
        self.phone = phone
        self.email = email
        self.company = company
        self.bio = bio
        self.photo = photo
        self.phoneListed = phoneListed
        self.emailListed = emailListed
    }
}
