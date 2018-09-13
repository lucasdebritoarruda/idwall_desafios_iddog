//
//  ViewController.swift
//  idwall_desafios_iddog
//
//  Created by Lucas de Brito on 11/09/2018.
//  Copyright © 2018 Lucas de Brito. All rights reserved.
//

import UIKit

class LoginController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Attributes
    var loginView: LoginView!
    
    // MARK: - View Controller Configuration
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        loginView.emailTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    func setupView() {
        let mainView = LoginView(frame:self.view.frame)
        self.loginView = mainView
        self.loginView.validationLabel.alpha = 0
        self.loginView.loginAttr = doLogin
        self.view.addSubview(loginView)
        loginView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        loginView.emailTextField.resignFirstResponder()
        return true
    }

    func doLogin(){
        guard let email = self.loginView.emailTextField.text, self.loginView.emailTextField.text?.characters.count != 0 else{
            self.loginView.validationLabel.alpha = 1
            self.loginView.validationLabel.text = "Please enter your email"
            print(self.loginView.emailTextField.text?.isValidEmail())
            return
        }
        if !(self.loginView.emailTextField.text?.isValidEmail())! {
            self.loginView.validationLabel.alpha = 1
            self.loginView.validationLabel.text = "Please enter valid email"
        }else{
            self.loginView.validationLabel.alpha = 0
        }
    }
    
}
