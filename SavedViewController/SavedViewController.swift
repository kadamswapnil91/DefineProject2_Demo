//
//  SavedViewController.swift
//  Assigment 2 Alamofire
//
//  Created by Swapnil Kadam on 01/07/20.
//  Copyright © 2020 Swapnil Kadam. All rights reserved.
//

import UIKit

class SavedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var savedtableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())

        // Do any additional setup after loading the view.
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
