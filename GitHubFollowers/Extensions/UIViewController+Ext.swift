//
//  UIViewController+Ext.swift
//  GitHubFollowers
//
//  Created by Thierno Diallo on 3/30/24.
//

import UIKit


//Created this extension so any ViewController can call it.

//Could've created a base controller that other VCs subclasses from but probably would have been too much. Extension might be easier to get them the option and not have the ability directly embedded into their system

extension UIViewController {
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalTransitionStyle = .crossDissolve
            alertVC.modalPresentationStyle = .overFullScreen
            self.present(alertVC, animated: true)
        }
    }
}
