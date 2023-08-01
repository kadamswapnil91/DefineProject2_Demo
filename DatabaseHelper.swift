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
            print("Data saved Sucessfully!!")
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
                print("Data Fetched Sucessfully!!")
            }
            catch{
                print("can not get data")
            }
            
            return user
    }
    
    func deleteData(index:Int) -> [User] {
        var user = getUserData()
        context?.delete(user[index])
        user.remove(at: index)
        
        do{
            try context?.save()
            print("Data Deleted Sucessfully!!")
        }
        catch{
            print("Can not delete data")
        }
        return user
    }
    
    func editData(object:[String:String], i :Int)
        {
            var user = getUserData()
            user[i].id = object["id"]
            user[i].name = object["name"]
            do{
                try context?.save()
                print("Data Updated Sucessfully!!")
            }
            catch
            {
                print("Data is naot edit")
            }
        
        
    }
    
    
    
}
