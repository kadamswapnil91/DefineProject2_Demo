//
//  SavedViewController.swift
//  Assigment 2 Alamofire
//
//  Created by Swapnil Kadam on 01/07/20.
//  Copyright © 2020 Swapnil Kadam. All rights reserved.
//

import UIKit

protocol Datapass2{

    func data(object:[String:String] , index:Int , isEdit:Bool)
}


class SavedViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{


    
    @IBOutlet weak var lbl_savedid: UILabel!
    
    @IBOutlet weak var lbl_savedname: UILabel!
    
   // @IBOutlet weak var SavedContentView: UIView!
    
    var delegate2: Datapass2!
    var saveuser = [SaveUser]()
  
    

    
    @IBOutlet weak var savedtableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().revealToggle(animated: true) //Hidesidemenu
        
        saveuser = Database2Helper.ShareInstance.getsavedUserData()
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return saveuser.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SavedTableViewCell", for: indexPath) as! SavedTableViewCell
        
        cell.lbl_savedid.text = saveuser[indexPath.row].id
        cell.lbl_savedName.text = saveuser[indexPath.row].name
        
        cell.SavedContent.layer.cornerRadius = 15
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }   //// can we edit row then yes
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            
            saveuser = Database2Helper.ShareInstance.deleteData(index: indexPath.row)
            self.savedtableview.deleteRows(at: [indexPath], with: .automatic)
            
        }
        
        
    }
    
    
    

}
