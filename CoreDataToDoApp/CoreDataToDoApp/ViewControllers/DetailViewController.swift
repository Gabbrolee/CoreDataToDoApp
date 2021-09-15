//
//  DetailViewController.swift
//  CoreDataToDoApp
//
//  Created by user on 14/09/2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    var delegate: detailViewControllerDelegate?
    var selectedcell: ToDoListItems?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let titleLabel: UILabel = {
        let tl = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        tl.textAlignment = .center
        tl.text = "Title"
        return tl
    }()
    
    let descriptionLabel: UILabel = {
        let dl = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        dl.textAlignment = .center
        dl.text = "Description"
        return dl
    }()
    
    let titleTextView: UITextView = {
        let tv = UITextView()
        tv.allowsEditingTextAttributes = true
        tv.autocapitalizationType = .sentences
        tv.text = ""
        tv.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        tv.backgroundColor = .lightGray
        tv.isEditable = true
        tv.font = UIFont.preferredFont(forTextStyle: .headline)
        return tv
    }()
    
    let descriptionTextView: UITextView = {
        let dt = UITextView()
        dt.allowsEditingTextAttributes = true
        dt.autocapitalizationType = .sentences
        dt.text = ""
        dt.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        dt.backgroundColor = .lightGray
        dt.isEditable = true
        dt.font = UIFont.preferredFont(forTextStyle: .headline)
        return dt
    }()
    
    let importanceSwitch: UISwitch = {
        let si = UISwitch(frame:CGRect(x: 150, y: 150, width: 0, height: 0))
        si.setOn(true, animated: false)
        si.isOn = true
        
        return si
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "To-Do-Details"
        view.backgroundColor = .darkGray
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(didTapSave))
        
        self.navigationItem.largeTitleDisplayMode = .never
        constraintViews()
        
    }
}

protocol detailViewControllerDelegate: AnyObject {
    func saveTodo(_ item: ToDoListItems)
}
