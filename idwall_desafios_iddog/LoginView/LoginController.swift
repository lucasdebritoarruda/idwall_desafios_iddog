//
//  ViewController.swift
//  idwall_desafios_iddog
//
//  Created by Lucas de Brito on 11/09/2018.
//  Copyright © 2018 Lucas de Brito. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire


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

    // MARK: - Login Functions
    func doLogin(){
        guard let email = self.loginView.emailTextField.text, self.loginView.emailTextField.text?.characters.count != 0 else{
            self.loginView.validationLabel.alpha = 1
            self.loginView.validationLabel.text = "Please enter your email"
            return
        }
        if !(self.loginView.emailTextField.text?.isValidEmail())! {
            self.loginView.validationLabel.alpha = 1
            self.loginView.validationLabel.text = "Please enter valid email"
        }else{
            self.loginView.validationLabel.alpha = 0
            self.loginView.loginButton.isEnabled = false
            self.loginView.loginButton.alpha = 0.5
            self.loginView.emailTextField.isEnabled = false
            let activityIN = UIActivityIndicatorView(activityIndicatorStyle: .gray)
            activityIN.center = CGPoint(x: self.view.center.x, y: self.view.center.y + 100)
            activityIN.hidesWhenStopped = true
            activityIN.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            activityIN.startAnimating()
            self.view.addSubview(activityIN)
            doLoginRequest(email: email){
                token in
                UserDefaultsManager.shared.isLoggedIn = true
                UserDefaultsManager.shared.token = token
                let mainController = UINavigationController(rootViewController: DogTypeTableView())
                self.present(mainController, animated: true, completion: nil)
                activityIN.stopAnimating()
                activityIN.removeFromSuperview()
            }
        }
    }
    
    func doLoginRequest(email:String, completion: @escaping (String) -> Void){
        let parameters = ["email" : email]
        let url = "https://api-iddog.idwall.co/signup"
        Alamofire.request(url , method: .post, parameters: parameters).responseJSON(completionHandler: { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let token = String(describing: json["user"]["token"])
                completion(token)
            case .failure(let error):
                print(error)
            }
        })
    }
    
}

