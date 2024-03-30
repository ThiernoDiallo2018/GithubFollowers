//
//  FollowerListVCViewController.swift
//  GitHubFollowers
//
//  Created by Thierno Diallo on 3/23/24.
//

import UIKit

/*
 We want to pass data to this screen, so it has to have the inputs we are sending over. If we want to send over a username, then this screen needs to have a username property 
 
 
 
 */

class FollowerListVC: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
