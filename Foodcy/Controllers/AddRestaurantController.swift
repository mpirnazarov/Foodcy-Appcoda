//
//  AddRestaurantController.swift
//  Foodcy
//
//  Created by Muslimbek on 01/08/2018.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit
import CoreData

class AddRestaurantController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Outlets
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var restaurantNameOutlet: UITextField!
    @IBOutlet var restaurantTypeOutlet: UITextField!
    @IBOutlet var restaurantLocationOutlet: UITextField!
    @IBOutlet var restaurantPhoneOutlet: UITextField!
    @IBOutlet var yesButton:UIButton!
    @IBOutlet var noButton:UIButton!
    
    // MARK: - Actions
    @IBAction func saveAction(segue:UIStoryboardSegue) {
        if restaurantNameOutlet?.text == "" || restaurantTypeOutlet?.text == "" || restaurantLocationOutlet?.text == ""{
            let valMessage = """
                Some fields are missing. Please fill all fields.
                For example:
                Name: Optional("For Kee Restaurant")
                Type: Optional("Hong Kong Style")
                Location: Optional("Hong Kong")
                Have you been here: true
            """
            
            let alert = UIAlertController(title: "Validation failed", message: valMessage, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            present(alert, animated: true, completion: nil)
        }
        else{
            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
                restaurant = RestaurantMO(context:
                    appDelegate.persistentContainer.viewContext)
                restaurant.name = restaurantNameOutlet.text
                restaurant.type = restaurantTypeOutlet.text
                restaurant.location = restaurantLocationOutlet.text
                restaurant.phone = restaurantPhoneOutlet.text
                restaurant.isVisited = isVisited
                if let restaurantImage = photoImageView.image {
                    if let imageData = UIImagePNGRepresentation(restaurantImage) {
                        restaurant.image = NSData(data: imageData) as Data
                    }
                }
                print("Saving data to context ...")
                appDelegate.saveContext()
            }
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBAction func toggleBeenHereButton(sender: UIButton) {
        print("Yes button clicked")
        if sender == yesButton {
            print("Yes")
            isVisited = true
            yesButton.backgroundColor = UIColor.red
            noButton.backgroundColor = UIColor.gray
        } else if sender == noButton {
            print("No")
            isVisited = false
            yesButton.backgroundColor = UIColor.gray
            noButton.backgroundColor = UIColor.red
        }
    }
    
    
    // MARK: - Variables
    var isVisited:Bool = false
    var restaurant:RestaurantMO!
    
    // MARK: - Native methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
                present(imagePicker, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: - Methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            photoImageView.image = selectedImage
            photoImageView.contentMode = .scaleAspectFill
            photoImageView.clipsToBounds = true
        }
        
        let leadingConstraint = NSLayoutConstraint(item: photoImageView, attribute:
            NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem:
            photoImageView.superview, attribute: NSLayoutAttribute.leading, multiplier: 1,
                                      constant: 0)
        leadingConstraint.isActive = true
        
        let trailingConstraint = NSLayoutConstraint(item: photoImageView,  attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: photoImageView.superview, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: 0)
        trailingConstraint.isActive = true
        
        let topConstraint = NSLayoutConstraint(item: photoImageView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: photoImageView.superview, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)
        topConstraint.isActive = true
        
        let bottomConstraint = NSLayoutConstraint(item: photoImageView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: photoImageView.superview, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0)
        bottomConstraint.isActive = true
        
        dismiss(animated: true, completion: nil)
    }

}
