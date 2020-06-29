//
//  DatabaseHelper.swift
//  Assigment 2 Alamofire
//
//  Created by Swapnil Kadam on 27/06/20.
//  Copyright © 2020 Swapnil Kadam. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper{
    
    static var ShareInstance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func save(object:[String:String]){
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context!) as! User
        
        user.id = object["id"]
        user.name = object["name"]
      
        
        
        do{
            try context?.save()
        }catch{
            print("Data is not saved")
        }
        
    }
    
    
    func getUserData() -> [User]
        {
            var user = [User]()
            
            let fetchRequest = NSFetchRequest <NSManagedObject>(entityName: "User")
            
            do
            {
                user = try context?.fetch(fetchRequest) as! [User]
            }
            catch{
                print("can not get data")
            }
            
            return user
        
        
        }
    
    
}
