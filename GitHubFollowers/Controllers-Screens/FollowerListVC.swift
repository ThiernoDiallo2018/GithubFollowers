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
    
    var username: String! //so we can put in a username

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
        
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            
            switch result {
            case .success(let followers):
                print(followers) //if success to whatever with the data
                // we do let followers so we have access to the data as a constant
                
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "It Did Not Work", message: error.rawValue, buttonTitle: "Ok") // if fails, present alert
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
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
