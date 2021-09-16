//
//  ViewController.swift
//  CoreDataToDoApp
//
//  Created by user on 14/09/2021.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var selectedcell: ToDoListItems?
    var models = [ToDoListItems]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var tableView = UITableView()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "To-Do List"
        view.addSubview(tableView)
        getAllItems()
        configureTableView()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
        
    }
}
