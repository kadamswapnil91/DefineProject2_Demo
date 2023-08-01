//
//  ListViewController.swift
//  Assigment 2 Alamofire
//
//  Created by Swapnil Kadam on 29/06/20.
//  Copyright © 2020 Swapnil Kadam. All rights reserved.
//

import UIKit
import CoreData

protocol Datapass{
    
    func data(object:[String:String] , index:Int , isEdit:Bool)
}


class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var delegate: Datapass!
    var user = [User]()
    
    
  
    
    //var dict = dict1()
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var lbl_Id: UILabel!
    
    @IBOutlet weak var lbl_Name: UILabel!
   
    var isLiked = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = DatabaseHelper.ShareInstance.getUserData()
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
    }
    
    
 
    @IBAction func Savedata_action(_ sender: Any)
    {
        
        
        let buttonPostion = (sender as AnyObject).convert((sender as AnyObject).bounds.origin, to: tableview)
        
        if let indexPath = tableview.indexPathForRow(at: buttonPostion) {
            let rowIndex =  indexPath.row
            
            print("Selected cell = ", user[rowIndex].id!)
            let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
            let saveuser = NSEntityDescription.insertNewObject(forEntityName: "SaveUser", into: context!) as! SaveUser
            saveuser.id = user[rowIndex].id
            saveuser.name = user[rowIndex].name
            
            do{
                try context?.save()
                
                let alert = UIAlertController (title: "Alert", message: "Cell Marked as Favorite!!!", preferredStyle: .alert)
                
                            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                            alert.addAction(ok)
                
                            present(alert, animated: true, completion: nil)
            
                print("Data saved Sucessfully!!")
            }catch{
                print("Data is not saved")
            }
       }
        
       
        
        
    }
    

    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
 
    
    

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listTableViewCell", for: indexPath) as! listTableViewCell
        
        cell.lbl_Id.text = user[indexPath.row].id
        cell.lbl_Name.text = user[indexPath.row].name
        
        cell.contentview.layer.cornerRadius = 15
        
      
//        if cell.isLiked == true {
//            cell.StarReference.setImage(UIImage(named: "red star.png"), for: UIControlState.normal)
//        }else {
//            cell.StarReference.setImage(UIImage(named: "star filled.png"), for: UIControlState.normal)
//        }
       
        cell.StarReference.addTarget(self, action: #selector( checkbtnClicked(sender:)), for: .touchUpInside)
    
         return cell
    }
      @objc func checkbtnClicked( sender: UIButton)
        {
            print("button pressed")
            
            if sender.isSelected{
                sender.isSelected = false
            }///uncheck
            else
            {
                sender.isSelected = true
            }
            
        }
        
        
        
    
        
    
    
    

    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return user.count
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }   //// can we edit row then yes
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            
            user = DatabaseHelper.ShareInstance.deleteData(index: indexPath.row)
            self.tableview.deleteRows(at: [indexPath], with: .automatic)
            
        }
        
        
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let dict = ["id":user[indexPath.row].id,"name":user[indexPath.row].name]
//        delegate.data(object: dict as! [String:String], index: indexPath.row, isEdit: true)
//        self.navigationController?.popViewController(animated: true)
        
        print("Row \(indexPath.row)selected")
        
    }
   


    

}
