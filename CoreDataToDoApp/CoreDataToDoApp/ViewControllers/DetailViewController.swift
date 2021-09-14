//
//  DetailViewController.swift
//  CoreDataToDoApp
//
//  Created by user on 14/09/2021.
//

import UIKit

class DetailViewController: UIViewController {
    
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
    
    @objc private func didTapSave(){
        navigationController?.popViewController(animated: true)
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
