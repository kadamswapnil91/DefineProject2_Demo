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
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
