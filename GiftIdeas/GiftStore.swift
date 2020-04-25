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
    func moveGift(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        // Get reference to object being moved so you can reinsert it
        let movedGift = allGifts[fromIndex]
        // Remove item from array
        allGifts.remove(at: fromIndex)
        // Insert item in array at new location
        allGifts.insert(movedGift, at: toIndex)
    }
    
    func removeGift(_ gift: Gift) {
        if let index = allGifts.firstIndex(of: gift) {
            allGifts.remove(at: index)
        }
    }
    
    
}
