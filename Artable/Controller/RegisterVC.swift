//
//  RegisterVC.swift
//  Artable
//
//  Created by AhMeD on 6/11/19.
//  Copyright © 2019 AhMeD. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    //MARK:- outlets
    
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var confirmPasswordTxt: UITextField!
    
    @IBOutlet weak var passwordCheckImg: UIImageView!
    @IBOutlet weak var confirmPassCheckImg: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    //MARK:- Function
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        confirmPasswordTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    //@objc Function
    @objc func textFieldDidChange(_ textField:UITextField){
        guard let passTxt = passwordTxt.text else{return}
        
        if textField == confirmPasswordTxt {
            passwordCheckImg.isHidden = false
            confirmPassCheckImg.isHidden = false
        }else{
            if passTxt.isEmpty {
                passwordCheckImg.isHidden = true
                confirmPassCheckImg.isHidden = true
                confirmPasswordTxt.text = ""
            }
        }
        
        if passwordTxt.text == confirmPasswordTxt.text {
            //show Green check image
            passwordCheckImg.image = UIImage(named: AppImages.GreenCheck)
            confirmPassCheckImg.image = UIImage(named: AppImages.GreenCheck)
        }else{
            //show red check image
            passwordCheckImg.image = UIImage(named: AppImages.RedCheck)
            confirmPassCheckImg.image = UIImage(named: AppImages.RedCheck)
        }
    }
    
    //MARK:- Action
    
    @IBAction func registerBtnWasPressed(_ sender: Any) {
        guard let email = emailTxt.text , !email.isEmpty,
              let name = nameTxt.text , !name.isEmpty,
              let password = passwordTxt.text , !password.isEmpty else{return}
        activityIndicator.startAnimating()
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                debugPrint(error)
                self.activityIndicator.stopAnimating()
                return
            }
            self.activityIndicator.stopAnimating()
            self.dismiss(animated: true, completion: nil)
            print("Succesfully registerd new user ..")
        }
    }
}
