//
//  SaveUser+CoreDataProperties.swift
//  
//
//  Created by Swapnil Kadam on 01/07/20.
//
//

import Foundation
import CoreData


extension SaveUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SaveUser> {
        return NSFetchRequest<SaveUser>(entityName: "SaveUser")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?

}
