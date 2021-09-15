//
//  HomeTableViewCell.swift
//  CoreDataToDoApp
//
//  Created by  Decagon on 14/09/2021.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    static let identifier = "HomeTableViewCell"
    
    var titleLabel: UILabel = {
        let tl = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        tl.font = UIFont.boldSystemFont(ofSize: 25.0)
        tl.translatesAutoresizingMaskIntoConstraints = false
        return tl
    }()
    
    var descriptionLabel: UILabel = {
        let dl = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        dl.font = UIFont(name: "Helvetica", size: 15)
        dl.translatesAutoresizingMaskIntoConstraints = false
        return dl
    }()
    
    var importanceImage: UIImageView = {
        let II = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        II.contentMode = .scaleAspectFit
        II.image = UIImage(named: "importantImage")
        II.translatesAutoresizingMaskIntoConstraints = false
        
        return II
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(importanceImage)
        setConstriant()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: HomeVCViewModel)   {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.desc
        if viewModel.importance == "important" {
            importanceImage.image = UIImage(named: "importantImage")
        } else {
            importanceImage.image = nil
        }
    }
    
    func setConstriant(){
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            
            importanceImage.heightAnchor.constraint(equalToConstant: 30),
            importanceImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            importanceImage.topAnchor.constraint(equalTo: topAnchor, constant: 35),
        ])
    }
}
