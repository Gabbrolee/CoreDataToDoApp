//
//  DetailVCExtension.swift
//  CoreDataToDoApp
//
//  Created by  Decagon on 15/09/2021.
//

import UIKit
import CoreData

extension DetailViewController{
    
    @objc func didTapSave(){
        performSaveAction()
        navigationController?.popViewController(animated: true)
    }
    
    func performSaveAction() {
        
        if selectedcell == nil {
            let item = ToDoListItems(context: context)
            item.title = titleTextView.text
            item.desc = descriptionTextView.text
            if importanceSwitch.isOn == true {
                item.importance = "important"
            }else {
                item.importance = "unimportant"
            }
            do {
                if titleTextView.text!.isEmpty {
                    let alert = UIAlertController(title: "Error", message: "Please fill in necessary fields", preferredStyle: .alert)
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                    alert.addAction(cancelAction)
                    self.present(alert, animated: true, completion: nil)
                    
                }
                else {
                    
                    delegate?.saveTodo(item)
                    navigationController?.popViewController(animated: true)
                }
            }
        }
        // MARK:- EDIT
        else {
            do {
                let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDoListItems")
                let results:NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let detail = result as! ToDoListItems
                    if(detail == selectedcell) {
                        detail.title = titleTextView.text
                        detail.desc = descriptionTextView.text
                        if importanceSwitch.isOn == true {
                            detail.importance = "important"
                        }
                        else {
                            detail.importance = "unimportant"
                        }
                        if titleTextView.text!.isEmpty {
                            let alert = UIAlertController(title: "Error", message: "Title or description cannot be empty", preferredStyle: .alert)
                            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                            alert.addAction(cancelAction)
                            self.present(alert, animated: true, completion: nil)
                        } else {
                            delegate?.saveTodo(detail)
                            navigationController?.popViewController(animated: true)
                        }
                    }
                }
            }
            catch {
                print("Fetch Failed")
            }
        }
    }
    
    func constraintViews() {
        
        [titleLabel, titleTextView, descriptionLabel, descriptionTextView, importanceSwitch].forEach { view in
            self.view.addSubview(view)
        }
        
        titleTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        importanceSwitch.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            titleTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            titleTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            titleTextView.heightAnchor.constraint(equalToConstant: 40),
            
            descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 120),
            
            importanceSwitch.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 60),
            importanceSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            importanceSwitch.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleTextView.bottomAnchor, constant: 100),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 20)
            
        ])
    }
    
}
