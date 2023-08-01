//
//  Database2Helper.swift
//  Assigment 2 Alamofire
//
//  Created by Swapnil Kadam on 01/07/20.
//  Copyright © 2020 Swapnil Kadam. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Database2Helper{
    
static var ShareInstance = Database2Helper()
let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

func save(object:[String:String]){
    let saveuser = NSEntityDescription.insertNewObject(forEntityName: "SaveUser", into: context!) as! SaveUser
    
    saveuser.id = object["id"]
    saveuser.name = object["name"]
    
    
    
    do{
        try context?.save()
        print("Data saved Sucessfully!!")
    }catch{
        print("Data is not saved")
    }
    
}
    
    
    
    func getsavedUserData() -> [SaveUser]
    {
        var saveuser = [SaveUser]()
        
        let fetchRequest = NSFetchRequest <NSManagedObject>(entityName: "SaveUser")
        
        do
        {
            saveuser = try context?.fetch(fetchRequest) as! [SaveUser]
            print("Data Fetched Sucessfully!!")
        }
        catch{
            print("can not get data")
        }
        
        return saveuser
    }
    
    
    
    
    func deleteData(index:Int) -> [SaveUser] {
        var saveuser = getsavedUserData()
        context?.delete(saveuser[index])
        saveuser.remove(at: index)
        
        do{
            try context?.save()
            print("Data Deleted Sucessfully!!")
        }
        catch{
            print("Can not delete data")
        }
        return saveuser
    }
    
    
    
    
    
    
}
