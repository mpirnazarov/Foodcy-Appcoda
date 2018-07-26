//
//  RestaurantTableViewController.swift
//  Foodcy
//
//  Created by Muslimbek on 25/07/2018.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    var restaurants:[Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong",  phone: "983-284334", image: "cafedeadend.jpg", isVisited: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", phone: "983-284334", image: "homei.jpg", isVisited: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", phone: "983-284334", image: "teakha.jpg", isVisited: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", phone: "983-284334", image: "cafeloisl.jpg", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", phone: "983-284334", image: "petiteoyster.jpg", isVisited: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", phone: "983-284334", image: "forkeerestaurant.jpg", isVisited: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", phone: "983-284334", image: "posatelier.jpg", isVisited: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", phone: "983-284334", image: "bourkestreetbakery.jpg", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", phone: "983-284334", image: "haighschocolate.jpg", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", phone: "983-284334", image: "palominoespresso.jpg", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location: "New York", phone: "983-284334", image: "upstate.jpg", isVisited: false),
        Restaurant(name: "Traif", type: "American", location: "New York", phone: "983-284334", image: "traif.jpg", isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", phone: "983-284334", image: "grahamavenuemeats.jpg", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", phone: "983-284334", image: "wafflewolf.jpg", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", phone: "983-284334", image: "fiveleaves.jpg", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", phone: "983-284334", image: "cafelore.jpg", isVisited: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York", phone: "983-284334", image: "confessional.jpg", isVisited: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", phone: "983-284334", image: "barrafina.jpg", isVisited: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", phone: "983-284334", image:  "donostia.jpg", isVisited: false),
        Restaurant(name: "Royal Oak", type: "British", location: "London", phone: "983-284334", image: "royaloak.jpg", isVisited: false),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", phone: "983-284334", image: "caskpubkitchen.jpg", isVisited: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Remove the title of the back button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! RestaurantDetailViewController
                destinationController.restaurant = restaurants[indexPath.row]
            }
        }
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
 
        // Configure the cell...
        cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.typeLabel.text = restaurants[indexPath.row].type
        cell.accessoryType = restaurants[indexPath.row].isVisited ? .checkmark : .none
        
        return cell
    } 

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // Social sharing button
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Share", handler: {(action, indexPath) -> Void in
            let defaultText = "Just checking in at " + self.restaurants[indexPath.row].name
            if let imageToShare = UIImage(named: self.restaurants[indexPath.row].image) {
                let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
        })
        
        // Delete button
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete") { (action, indexPath) -> Void in
            // Delete the row from the data source
            self.restaurants.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let otherAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Other") { (action, indexPath) in
            //  Create an option menu as an action sheet
            let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
            
            //  Add actions to the menu
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            optionMenu.addAction(cancelAction)
            
            // Add Call action
            let callActionHandler = { (action:UIAlertAction!) -> Void in
                let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
                alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertMessage, animated: true, completion: nil)
            }
            let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)",
                style: .default, handler: callActionHandler)
            optionMenu.addAction(callAction)
            
            //  Add Check-in or check-out action
            let checkInTitle = !self.restaurants[indexPath.row].isVisited ? "Check in" : "Check out"
            
            let checkInActionHandler = UIAlertAction(title: checkInTitle, style: .default, handler:
            {
                (action: UIAlertAction!) -> Void in
                let cell = tableView.cellForRow(at: indexPath)
                cell?.accessoryType = self.restaurants[indexPath.row].isVisited ? .none : .checkmark
                self.restaurants[indexPath.row].isVisited = self.restaurants[indexPath.row].isVisited ? false : true
            })
            
            optionMenu.addAction(checkInActionHandler)
            
            //  Display the menu
            self.present(optionMenu, animated: true, completion: nil)
            
            tableView.deselectRow(at: indexPath, animated: false)
        }
        
        // Changing colors of action buttons
        shareAction.backgroundColor = UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0)
        otherAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor.red
        
        return [otherAction, shareAction, deleteAction]
    }
    
    

}
