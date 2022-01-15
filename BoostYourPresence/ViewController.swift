//
//  ViewController.swift
//  BoostYourPresence
//
//  Created by Emily Mittleman on 1/13/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let services = Services()
        
        services.addOrder(link: "https://www.instagram.com/p/BNx6uASAZ6m/", quantity: "25")
    }


}

