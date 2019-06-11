//
//  ViewController.swift
//  Artable
//
//  Created by AhMeD on 6/11/19.
//  Copyright © 2019 AhMeD. All rights reserved.
//

import UIKit
import Firebase
class HomeVC: UIViewController {
    //MARK:- outlets
    @IBOutlet weak var loginInOutBtn: UIBarButtonItem!
    
    //MARK:- Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        if let _ = Auth.auth().currentUser {
            //open homeVC
            loginInOutBtn.title = "Logout"
        }else{
            //go to login VC
            loginInOutBtn.title = "Login"
        }
    }
    
    
    
    fileprivate func presentLoginController() {
        let sb = UIStoryboard.init(name: Storyboard.LoginStoryboard, bundle: Bundle.main)
        let controller = sb.instantiateViewController(withIdentifier: StorybaordId.LoginVC)
        present(controller, animated: true, completion: nil)
    }
    

    //MARK:- Action
    @IBAction func loginInOutBtnWasPressed(_ sender: Any) {
        if let _ = Auth.auth().currentUser {
            do {
                try Auth.auth().signOut()
                //go to login Screen
                presentLoginController()
            }catch{
                debugPrint(error.localizedDescription)
            }
        }else{
            //new login
            presentLoginController()
        }
    
    }
    
}

