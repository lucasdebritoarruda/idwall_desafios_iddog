//
//  ViewController.swift
//  idwall_desafios_iddog
//
//  Created by Lucas de Brito on 11/09/2018.
//  Copyright © 2018 Lucas de Brito. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: - Attributes
    var loginView: LoginView!
    
    // MARK: - View Controller Configuration
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    func setupView() {
        let mainView = LoginView(frame:self.view.frame)
        self.loginView = mainView
        self.view.addSubview(loginView)
        loginView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
}

