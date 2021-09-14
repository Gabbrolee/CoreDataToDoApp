//
//  ToDoListItems+CoreDataProperties.swift
//  CoreDataToDoApp
//
//  Created by user on 14/09/2021.
//
//

import Foundation
import CoreData


extension ToDoListItems {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListItems> {
        return NSFetchRequest<ToDoListItems>(entityName: "ToDoListItems")
    }

    @NSManaged public var dateCreated: Date?
    @NSManaged public var desc: String?
    @NSManaged public var id: Int32
    @NSManaged public var importance: String?
    @NSManaged public var title: String?

}

extension ToDoListItems : Identifiable {

}
