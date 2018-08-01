//
//  ReviewViewController.swift
//  Foodcy
//
//  Created by Muslimbek on 30/07/2018.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    // MARK: - Variables
    var restaurant: RestaurantMO?
    // MARK: - Actions
    
    
    // MARK: - Outlets
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var restaurantImage: UIImageView!
    
    // MARK: - Native methods
    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantImage.image = UIImage(data: restaurant?.image as! Data)
        
        // Blur effect
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        // Animation
//        let scaleTransform = CGAffineTransform.init(scaleX: 0, y: 0)
//        let translateTransform = CGAffineTransform.init(translationX: 0, y: -1000)
//        let combineTransform = scaleTransform.concatenating(translateTransform)
//        containerView.transform = combineTransform
    }
    
    
//    override func viewDidAppear(_ animated: Bool) {
//        UIView.animate(withDuration: 0.3, animations: {
//            self.containerView.transform = CGAffineTransform.identity
//        })
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
