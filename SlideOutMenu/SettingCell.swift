//
//  SettingCell.swift
//  SlideOutMenu
//
//  Created by Michael Doroff on 1/25/18.
//  Copyright © 2018 Michael Doroff. All rights reserved.
//

import UIKit
import LBTAComponents

class SettingCell: BaseCell {
    
    var setting: Setting? {
        didSet {
            nameLabel.text = setting?.name
            
            if let imageName = setting?.imageName {
                iconImageView.image = UIImage(named: imageName)
            }
            
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Setting"
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    let iconImageView: UIImageView = {
       let imageView = UIImageView()
       imageView.image = UIImage(named: "settings")
       imageView.contentMode = .scaleAspectFill
        return imageView
    
    }()
    
    
    override func setupViews() {
         super.setupViews()

        addSubview(nameLabel)
        addSubview(iconImageView)
        
        addConstraintsWithFormat("H:|-8-[v0(30)]-8-[v1]|", views: iconImageView, nameLabel)
    
        addConstraintsWithFormat("V:|-16-[v0]", views: nameLabel)
    
        addConstraintsWithFormat("V:[v0(30)]", views: iconImageView)
        
        addConstraint(NSLayoutConstraint(item: iconImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
}

