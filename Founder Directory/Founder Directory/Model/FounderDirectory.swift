//
//  FounderDirectory.swift
//  Founder Directory
//
//  Created by Misha Milovidov on 9/29/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import Foundation

class FounderDirectory {
    
    // MARK: - Properties
    
    var fullnameSet: [String] = []
    var photoSet: [String] = []
    var companySet: [String] = []
    
    let founders : [Founder] = [
        Founder(firstName: "Chewbacca",
                lastName: "Wookiee",
                preferredName: "Chewie",
                phone: "801-555-1212",
                email: "chewie@gmail.com",
                company: "Millenium Falcon Company",
                bio: "Chewbacca, nicknamed 'Chewie', is a fictional character in the Star Wars franchise. He is a Wookiee, a tall, hirsute biped and intelligent species from the planet Kashyyyk. Chewbacca is the loyal friend and associate of Han Solo, and serves as co-pilot on Solo's ship, the Millenium Falcon.",
                photo: "chewie"),
        Founder(firstName: "Leia",
                lastName: "Princess",
                preferredName: "Your Highness",
                phone: "385-555-1212",
                email: "leia@gmail.com",
                company: "The Rebel Company",
                bio: "",
                photo: "leia"),
        Founder(firstName: "Han",
                lastName: "Solo",
                preferredName: "Han",
                phone: "214-555-1212",
                email: "han@gmail.com",
                company: "Millenium Falcon Company",
                bio: "",
                photo: "han"),
        Founder(firstName: "Luke",
                lastName: "Skywalker",
                preferredName: "Luke",
                phone: "408-555-1212",
                email: "luke@gmail.com",
                company: "Jedi Company",
                bio: "",
                photo: "luke")
    ]
    
    // MARK: - Singleton pattern
    
    static let sharedInstance = FounderDirectory()
    
    private init() {
        update()
    }
    
    // MARK: - Private Helpers
    
    private func update() {
        
        fullnameSet = []
        photoSet = []
        companySet = []
        
        for founder in founders {
            fullnameSet.append("\(founder.firstName) \(founder.lastName)")
            companySet.append(founder.company)
            photoSet.append(founder.photo)
        }
        
    }
    
    // MARK: - Public Helpers
}
