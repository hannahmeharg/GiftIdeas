//
//  GiftStore.swift
//  GiftIdeas
//
//  Created by Hannah Meharg on 4/25/20.
//  Copyright © 2020 Hannah Meharg. All rights reserved.
//

import UIKit

class GiftStore {
    var allGifts = [Gift]()
    
    @discardableResult func createGift() -> Gift {
        let newGift = Gift(random: true)
        allGifts.append(newGift)
        return newGift
    }
    
    init() {
        for _ in 0..<5 {
            createGift()
        }
    }
    
    
}
