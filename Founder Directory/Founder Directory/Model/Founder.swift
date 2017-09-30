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
    var phone: String
    var email: String
    var company: String
    var bio: String
    var photo: String
    
    // MARK: - Initialization
    
    init(firstName: String, lastName: String, preferredName: String, phone: String, email: String, company: String, bio: String, photo: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.preferredName = preferredName
        self.phone = phone
        self.email = email
        self.company = company
        self.bio = bio
        self.photo = photo
    }
}
