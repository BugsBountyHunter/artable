//
//  LoginVC.swift
//  Artable
//
//  Created by AhMeD on 6/11/19.
//  Copyright © 2019 AhMeD. All rights reserved.
//

import UIKit
import Firebase
class LoginVC: UIViewController {
    //MARK:- outlets
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK:- Functions
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //MARK:- Actions
    @IBAction func loginBtnWasPressed(_ sender: Any) {
        
        guard let email = emailTxt.text , !email.isEmpty ,
              let password = passwordTxt.text , !password.isEmpty else{return}
        activityIndicator.startAnimating()
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                debugPrint(error)
                self.activityIndicator.stopAnimating()
                return
            }
            
            self.activityIndicator.stopAnimating()
            self.dismiss(animated: true, completion: nil)
            print("Login Successfully")
        }
        
    }
    
}
