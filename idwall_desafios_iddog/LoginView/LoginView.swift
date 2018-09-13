//
//  LoginView.swift
//  idwall_desafios_iddog
//
//  Created by Lucas de Brito on 11/09/2018.
//  Copyright © 2018 Lucas de Brito. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    // MARK: - Attributes
    var loginAttr:(() -> Void)?
    
    
    // MARK: - View Configuration
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
    func setup() {
        let stackView = createStackView(views: [logoImgView,emailTextField,
                                                loginButton,validationLabel])
        addSubview(bgImgView)
        addSubview(stackView)
        bgImgView.setAnchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        stackView.setAnchor(width: self.frame.width - 80, height: 240)
        stackView.centerYAnchor.constraint(equalTo:self.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo:self.centerXAnchor).isActive = true
    }
    
    // MARK: - Creation of components
    let bgImgView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pug_bg")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let logoImgView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"logo-idwall-orange")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField(placeHolder:"Email", borderColor: UIColor.customOrange)
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(title: "Login", titleColor: .white, backGroundColor: .customOrange, borderColor: .customOrange)
        button.addTarget(self, action: #selector(loginFunction), for: .touchUpInside)
        return button
    }()
    
    let validationLabel: UILabel = {
        let label = UILabel()
        label.text = " "
        label.setAnchor(width: 0, height: 40)
        label.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.5)
        label.layer.cornerRadius = 5
        label.textAlignment = .center
        return label
    }()
    
    
    @objc func loginFunction(){
        loginAttr?()
    }
    
}
