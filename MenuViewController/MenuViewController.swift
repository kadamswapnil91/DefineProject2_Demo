//
//  MenuViewController.swift
//  Assigment 2 Alamofire
//
//  Created by Swapnil Kadam on 26/06/20.
//  Copyright © 2020 Swapnil Kadam. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btn_AllMatches(_ sender: UIButton) {
        
        if let listview = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as? ListViewController {
            let navController = UINavigationController(rootViewController: listview)
            navController.setViewControllers([listview], animated:true)
            self.revealViewController().setFront(navController, animated: true)
        }
        
    }
    
    
    @IBAction func btn_SavedMatches(_ sender: UIButton) {
        
        if let savedView = self.storyboard?.instantiateViewController(withIdentifier: "SavedViewController") as? SavedViewController {
            let navController = UINavigationController(rootViewController: savedView)
            navController.setViewControllers([savedView], animated:true)
            self.revealViewController().setFront(navController, animated: true)
        }
        
        
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
