//
//  RestaurantDetailViewController.swift
//  Foodcy
//
//  Created by Muslimbek on 25/07/2018.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var restaurantImageView:UIImageView!
    
    // MARK: - Variables
    var restaurantImage = ""
    
    //MARK: - Native methods
    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantImageView.image = UIImage(named: restaurantImage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
