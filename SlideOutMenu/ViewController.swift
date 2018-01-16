//
//  ViewController.swift
//  SlideOutMenu
//
//  Created by Michael Doroff on 1/5/18.
//  Copyright © 2018 Michael Doroff. All rights reserved.
//

import UIKit
import LBTAComponents


class ViewController: UIViewController {

    
    let menuButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 40, g: 100, b: 151)
        button.setTitle("Menu", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleMore), for: .touchUpInside)
        return button
        
    }()
    
    let settingsLauncher = SettingsLauncher()
    
    @objc func handleMore() {
        settingsLauncher.showSettings()
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        view.addSubview(menuButton)
        
        
        menuButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 100, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 55)
    
    }

    
}

