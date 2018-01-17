//
//  SettingsLauncher.swift
//  SlideOutMenu
//
//  Created by Michael Doroff on 1/14/18.
//  Copyright © 2018 Michael Doroff. All rights reserved.
//

import Foundation
import UIKit

class SettingsLauncher: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let blackView = UIView()

    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        return cv
        
    }()
    let cellid = "cellid"
    
    
    @objc public func showSettings() { 
        
        if let window = UIApplication.shared.keyWindow {
            
            let height: CGFloat = 200
            let y = window.frame.height - height
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            window.addSubview(blackView)
            window.addSubview(collectionView)
            
            let point = CGPoint(x: 0, y: window.frame.height)
            let size = CGSize(width: window.frame.width, height: height)
            
            
            collectionView.frame = CGRect(origin: point, size: size)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            blackView.frame = window.frame
            blackView.alpha = 0
      
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                self.blackView.alpha = 1
                
                self.collectionView.frame = CGRect(origin: CGPoint(x: 0, y: y), size: CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height))
                
            }, completion: nil)
            
            

        }
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath)
        return cell
    }
    
    @objc public func handleDismiss() {
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
                self.collectionView.frame = CGRect(origin: CGPoint(x: 0, y: window.frame.height), size: CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height))
                
            }
        }
    }
    override init() {
        super.init()
        collectionView.dataSource = self
        collectionView.delegate = self
    }

}
