//
//  ListViewController.swift
//  Assigment 2 Alamofire
//
//  Created by Swapnil Kadam on 29/06/20.
//  Copyright © 2020 Swapnil Kadam. All rights reserved.
//

import UIKit

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var user = [User]()
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var lbl_Id: UILabel!
    
    @IBOutlet weak var lbl_Name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = DatabaseHelper.ShareInstance.getUserData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listTableViewCell", for: indexPath) as! listTableViewCell
        
        cell.lbl_Id.text = user[indexPath.row].id
        cell.lbl_Name.text = user[indexPath.row].name
        
        return cell
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return user.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            
            user = DatabaseHelper.ShareInstance.deleteData(index: indexPath.row)
            self.tableview.deleteRows(at: [indexPath], with: .automatic)
            
        }
        
        
    }
    
    
    
    

}
