//
//  ItemsViewController.swift
//  GiftIdeas
//
//  Created by Hannah Meharg on 4/25/20.
//  Copyright © 2020 Hannah Meharg. All rights reserved.
//

import UIKit
class ItemsViewController: UITableViewController {
    var giftStore: GiftStore!
    
    @IBAction func addNewGift(_ sender: UIButton) {
        // Create a new item and add it to the store
         let newGift = giftStore.createGift()
         // Figure out where that item is in the array
        if let index = giftStore.allGifts.firstIndex(of: newGift) {
            let indexPath = IndexPath(row: index, section: 0)
            // Insert this new row into the table
            tableView.insertRows(at: [indexPath], with: .automatic)
         }
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        // If you are currently in editing mode...
         if isEditing {
            // Change text of button to inform user of state
            sender.setTitle("Edit", for: .normal)
            // Turn off editing mode
            setEditing(false, animated: true)
         } else {
            // Change text of button to inform user of state
            sender.setTitle("Done", for: .normal)
            // Enter editing mode
            setEditing(true, animated: true)
         }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Get the height of the status bar
        
        let height = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0

        let insets = UIEdgeInsets(top: height, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return giftStore.allGifts.count
    }
    
    override func tableView(_ tableView: UITableView,
    cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell, with default appearance
        // Get a new or recycled cell
         let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell",
        for: indexPath)
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let item = giftStore.allGifts[indexPath.row]
        cell.textLabel?.text = item.person
        cell.detailTextLabel?.text = item.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // If the table view is asking to commit a delete command...
        if editingStyle == .delete {
            let gift = giftStore.allGifts[indexPath.row]
            // Remove the item from the store
            giftStore.removeGift(gift)
            // Also remove that row from the table view with an animation
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}
