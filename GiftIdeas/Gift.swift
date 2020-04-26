//
//  Gift.swift
//  GiftIdeas
//
//  Created by Hannah Meharg on 4/25/20.
//  Copyright © 2020 Hannah Meharg. All rights reserved.
//

import UIKit

class Gift: NSObject, NSCoding {
    var name: String
    var person: String
    var occasion: String
    var comments: String?
    let dateCreated: Date
    
    
    init(name: String, occasion: String, person: String, comments: String?) {
        self.name = name
        self.person = person
        self.comments = comments
        self.occasion = occasion
        self.dateCreated = Date()
        super.init()
     }
    
    convenience init(random: Bool = false) {
        if random {
            let names = ["blanket", "mug", "shirt"]
            let persons = ["Daniela", "Alexa", "Kaylee"]
            let occasions = ["birthday", "wedding","anniversary"]
            
            var idx = arc4random_uniform(UInt32(names.count))
            let randomName = names[Int(idx)]
            
            idx = arc4random_uniform(UInt32(persons.count))
            let randomPerson = persons[Int(idx)]
            
            idx = arc4random_uniform(UInt32(occasions.count))
            let randomOccasion = occasions[Int(idx)]
            
            let randomComment =
            UUID().uuidString.components(separatedBy: "-").first!

            
            self.init(name: randomName,
                      occasion: randomOccasion,
                      person: randomPerson,
                      comments: randomComment)
        } else {
            self.init(name: "",
                      occasion: "",
                      person: "",
                      comments: "")
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(dateCreated, forKey: "dateCreated")
        aCoder.encode(person, forKey: "person")
        aCoder.encode(occasion, forKey: "occasion")
        aCoder.encode(comments, forKey: "comments")
        
    }
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        dateCreated = aDecoder.decodeObject(forKey: "dateCreated") as! Date
        person = aDecoder.decodeObject(forKey: "person") as! String
        occasion = aDecoder.decodeObject(forKey: "occasion") as! String
        comments = aDecoder.decodeObject(forKey: "comments") as! String?
        
        super.init()
    }
    
    
}
