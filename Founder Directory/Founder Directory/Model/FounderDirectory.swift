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
                spouseName: "Mrs. Wookiee",
                phone: "8015551212",
                email: "chewie@gmail.com",
                company: "Millenium Falcon Company",
                bio: "Chewbacca, nicknamed 'Chewie', is a fictional character in the Star Wars franchise. He is a Wookiee, a tall, hirsute biped and intelligent species from the planet Kashyyyk. Chewbacca is the loyal friend and associate of Han Solo, and serves as co-pilot on Solo's ship, the Millenium Falcon.",
                photo: #imageLiteral(resourceName: "chewie"),
                phoneListed: true,
                emailListed: true),
        Founder(firstName: "Leia",
                lastName: "Princess",
                preferredName: "Your Highness",
                fullName: "",
                spouseName: "",
                phone: "3855551212",
                email: "leia@gmail.com",
                company: "The Rebel Company",
                bio: "Princess Leia Organa of Alderaan (also Senator Leia Organa or General Leia Organa) is a fictional character in the Star Wars franchise, portrayed in films by Carrie Fisher. Introduced in the original Star Wars film in 1977, Leia is princess of the planet Alderaan, a member of the Imperial Senate and an agent of the Rebel Alliance.",
                photo: #imageLiteral(resourceName: "leia"),
                phoneListed: true,
                emailListed: true),
        Founder(firstName: "Han",
                lastName: "Solo",
                preferredName: "Han",
                fullName: "",
                spouseName: "",
                phone: "2145551212",
                email: "han@gmail.com",
                company: "Millenium Falcon Company",
                bio: "Han Solo is a character in the Star Wars franchise. In the original film trilogy, Han and his co-pilot, Chewbacca, became involved in the Rebel Alliance's struggle against the Galactic Empire. During the course of the Star Wars narrative, he becomes a chief figure in the Alliance and succeeding galactic governments.",
                photo: #imageLiteral(resourceName: "han"),
                phoneListed: true,
                emailListed: true),
        Founder(firstName: "Luke",
                lastName: "Skywalker",
                preferredName: "Luke",
                fullName: "",
                spouseName: "",
                phone: "4085551212",
                email: "luke@gmail.com",
                company: "Jedi Company",
                bio: "Luke Skywalker is a fictional character and the main protagonist of the original film trilogy of the Star Wars franchise created by George Lucas. The character, portrayed by Mark Hamill, is an important figure in the Rebel Alliance's struggle against the Galactic Empire. He is the twin brother of Rebellion leader Princess Leia Organa of Alderaan, a friend and brother-in-law of smuggler Han Solo, an apprentice to Jedi Masters Obi-Wan \'Ben\' Kenobi and Yoda, the son of fallen Jedi Anakin Skywalker (Darth Vader) and Queen of Naboo/Republic Senator Padmé Amidala and maternal uncle of Kylo Ren / Ben Solo.",
                photo: #imageLiteral(resourceName: "luke"),
                phoneListed: true,
                emailListed: true)
    ]
    
    // MARK: - Singleton pattern
    
    static let sharedInstance = FounderDirectory()
    
    private init() {
        update()
    }
    
    // MARK: - Private Helpers
    
    private func update() {
        
        for founder in founders {
            founder.fullName = Helpers.setFullName(firstName: founder.firstName, lastName: founder.lastName)
            founderSet.append(founder)
        }
        
    }
    
}
