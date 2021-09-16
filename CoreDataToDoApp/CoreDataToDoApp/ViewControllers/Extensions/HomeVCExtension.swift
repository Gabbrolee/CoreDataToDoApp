//
//  HomeVCExtension.swift
//  CoreDataToDoApp
//
//  Created by  Decagon on 15/09/2021.
//

import UIKit

extension HomeViewController {
    
    func configureTableView(){
        view.addSubview(tableView)
        tableView.rowHeight = 100
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK:- Core Data
    func getAllItems(){
        do {
            models = try context.fetch(ToDoListItems.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
            print ("\(error.localizedDescription)")
        }
    }
    
    func createItems(_ items: ToDoListItems){
        do {
            try context.save()
            getAllItems()
        }
        catch {
            print ("\(error.localizedDescription)")
        }
    }
}

extension HomeViewController : detailViewControllerDelegate {
    func saveTodo(_ item: ToDoListItems) {
        self.createItems(item)
    }
    
    @objc func didTapAdd(){
        let detailViewController = DetailViewController()
        detailViewController.delegate = self
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
        cell.configure(with: HomeViewModel(with: model))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailViewController = DetailViewController()
        detailViewController.delegate = self
        self.navigationController?.pushViewController(detailViewController, animated: true)
        let selectedcell : ToDoListItems
        selectedcell = models[indexPath.row]
        detailViewController.selectedcell = selectedcell
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            // which person to remove
            let modelToRemove = self.models[indexPath.row]
            //remove the person
            self.context.delete(modelToRemove)
            // save data
            do{
                try self.context.save()
            }
            catch {
                
            }
            self.getAllItems()
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
}
