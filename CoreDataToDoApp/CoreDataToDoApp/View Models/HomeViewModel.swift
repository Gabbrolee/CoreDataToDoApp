//
//  HomeViewModel.swift
//  CoreDataToDoApp
//
//  Created by  Decagon on 15/09/2021.
//

import UIKit.UIImage
import CoreData

struct HomeViewModel {
    
    let title: String?
    let desc: String?
    let importance: String?
    let image: UIImage?
    
    init(with model: ToDoListItems) {
        title = model.title
        desc = model.desc
        importance = model.importance
        image = UIImage(named: "importantImage")
    }
}

