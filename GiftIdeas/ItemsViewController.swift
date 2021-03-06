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
    
    @IBAction func addNewGift(_ sender: UIBarButtonItem) {
        // Create a new item and add it to the store
         let newGift = giftStore.createGift()
         // Figure out where that item is in the array
        if let index = giftStore.allGifts.firstIndex(of: newGift) {
            let indexPath = IndexPath(row: index, section: 0)
            // Insert this new row into the table
            tableView.insertRows(at: [indexPath], with: .automatic)
         }
    }
    
//    @IBAction func toggleEditingMode(_ sender: UIButton) {
//        // If you are currently in editing mode...
//         if isEditing {
//            // Change text of button to inform user of state
//            sender.setTitle("Edit", for: .normal)
//            // Turn off editing mode
//            setEditing(false, animated: true)
//         } else {
//            // Change text of button to inform user of state
//            sender.setTitle("Done", for: .normal)
//            // Enter editing mode
//            setEditing(true, animated: true)
//         }
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return giftStore.allGifts.count
    }
    
    override func tableView(_ tableView: UITableView,
    cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell, with default appearance
        // Get a new or recycled cell
         let cell = tableView.dequeueReusableCell(withIdentifier: "GiftCell",
         for: indexPath) as! GiftCell
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let item = giftStore.allGifts[indexPath.row]
//        cell.textLabel?.text = item.person
//        cell.detailTextLabel?.text = item.name
        // Configure the cell with the Item
        cell.nameLabel.text = item.name
        cell.personLabel.text = item.person
        cell.occasionLabel.text = item.occasion
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // If the table view is asking to commit a delete command...
        if editingStyle == .delete {
            let gift = giftStore.allGifts[indexPath.row]
            let title = "Delete \(gift.name)?"
            let message = "Are you sure you want to delete this gift?"
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive,
            handler: { (action) -> Void in
                // Remove the item from the store
                self.giftStore.removeGift(gift)
                // Also remove that row from the table view with an animation
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            ac.addAction(deleteAction)
            // Present the alert controller
            present(ac, animated: true, completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath,
    to destinationIndexPath: IndexPath) {
        // Update the model
        giftStore.moveGift(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If the triggered segue is the "showItem" segue
        switch segue.identifier {
        case "showItem"?:
            // Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                // Get the item associated with this row and pass it along
                let gift = giftStore.allGifts[row]
                let detailViewController = segue.destination as! DetailViewController
                detailViewController.gift = gift
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    
}
