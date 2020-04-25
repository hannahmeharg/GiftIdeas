//
//  Gift.swift
//  GiftIdeas
//
//  Created by Hannah Meharg on 4/25/20.
//  Copyright © 2020 Hannah Meharg. All rights reserved.
//

import UIKit

class Gift: NSObject {
    var name: String
    var person: String
    let dateCreated: Date
    
    init(name: String, person: String) {
        self.name = name
        self.person = person
        self.dateCreated = Date()
        super.init()
     }
    
    convenience init(random: Bool = false) {
        if random {
            let names = ["blanket", "mug", "shirt"]
            let persons = ["Daniela", "Alexa", "Kaylee"]
            
            var idx = arc4random_uniform(UInt32(names.count))
            let randomName = names[Int(idx)]
            
            idx = arc4random_uniform(UInt32(persons.count))
            let randomPerson = persons[Int(idx)]
            
            self.init(name: randomName,
                      person: randomPerson)
        } else {
            self.init(name: "",
                      person: "")
        }
    }
    
}
