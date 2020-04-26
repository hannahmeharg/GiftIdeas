//
//  DetailViewController.swift
//  GiftIdeas
//
//  Created by Hannah Meharg on 4/25/20.
//  Copyright © 2020 Hannah Meharg. All rights reserved.
//

import UIKit
class DetailViewController: UIViewController {
    
    @IBOutlet var dateField: UILabel!
    @IBOutlet var commentsField: UITextField!
    @IBOutlet var occasionField: UITextField!
    @IBOutlet var giftField: UITextField!
    @IBOutlet var personField: UITextField!
    
    var gift: Gift!
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        giftField.text = gift.name
        personField.text = gift.person
        occasionField.text = gift.occasion
        commentsField.text = gift.comments
        dateField.text = dateFormatter.string(from: gift.dateCreated)
    }
}

