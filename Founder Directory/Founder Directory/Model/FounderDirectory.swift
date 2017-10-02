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
    var founderSet: [Founder] = []
    
    let founders : [Founder] = [
        Founder(firstName: "Chewbacca",
                lastName: "Wookiee",
                preferredName: "Chewie",
                fullName: "",
                spouseName: "",
                phone: "8015551212",
                email: "chewie@gmail.com",
                company: "Millenium Falcon Company",
                bio: "Chewbacca, nicknamed 'Chewie', is a fictional character in the Star Wars franchise. He is a Wookiee, a tall, hirsute biped and intelligent species from the planet Kashyyyk. Chewbacca is the loyal friend and associate of Han Solo, and serves as co-pilot on Solo's ship, the Millenium Falcon.",
                photo: "chewie"),
        Founder(firstName: "Leia",
                lastName: "Princess",
                preferredName: "Your Highness",
                fullName: "",
                spouseName: "",
                phone: "3855551212",
                email: "leia@gmail.com",
                company: "The Rebel Company",
                bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris tempor metus erat, id sollicitudin orci pellentesque et. Cras ac leo sit amet risus lobortis facilisis. Pellentesque ac nisi ut magna aliquam porta in eu urna. Nunc in mi scelerisque, vulputate dui id, mollis lectus. Ut non pretium enim, eu feugiat lectus.",
                photo: "leia"),
        Founder(firstName: "Han",
                lastName: "Solo",
                preferredName: "Han",
                fullName: "",
                spouseName: "",
                phone: "2145551212",
                email: "han@gmail.com",
                company: "Millenium Falcon Company",
                bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris tempor metus erat, id sollicitudin orci pellentesque et. Cras ac leo sit amet risus lobortis facilisis. Pellentesque ac nisi ut magna aliquam porta in eu urna. Nunc in mi scelerisque, vulputate dui id, mollis lectus. Ut non pretium enim, eu feugiat lectus.",
                photo: "han"),
        Founder(firstName: "Luke",
                lastName: "Skywalker",
                preferredName: "Luke",
                fullName: "",
                spouseName: "",
                phone: "4085551212",
                email: "luke@gmail.com",
                company: "Jedi Company",
                bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris tempor metus erat, id sollicitudin orci pellentesque et. Cras ac leo sit amet risus lobortis facilisis. Pellentesque ac nisi ut magna aliquam porta in eu urna. Nunc in mi scelerisque, vulputate dui id, mollis lectus. Ut non pretium enim, eu feugiat lectus.",
                photo: "luke")
    ]
    
    // MARK: - Singleton pattern
    
    static let sharedInstance = FounderDirectory()
    
    private init() {
        update()
    }
    
    // MARK: - Private Helpers
    
    private func update() {
        
        for founder in founders {
            founder.fullName = "\(founder.firstName) \(founder.lastName)"
            founderSet.append(founder)
        }
        
    }
    
    // MARK: - Public Helpers
}
