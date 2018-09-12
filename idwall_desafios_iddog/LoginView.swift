//
//  LoginView.swift
//  idwall_desafios_iddog
//
//  Created by Lucas de Brito on 11/09/2018.
//  Copyright © 2018 Lucas de Brito. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    // MARK: - View Configuration
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        let stackView = mainStackView()
        addSubview(bgImgView)
        addSubview(stackView)
        bgImgView.setAnchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        stackView.setAnchor(width: self.frame.width - 60, height: 150)
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
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 1, green: 102/255, blue: 0, alpha: 1).cgColor
        textField.layer.cornerRadius = 5
        textField.textColor = .black
        textField.font = UIFont.boldSystemFont(ofSize: 14)
        textField.autocorrectionType = .no
        var placeHolder = NSMutableAttributedString()
        placeHolder = NSMutableAttributedString(attributedString: NSAttributedString(string:"E-mail", attributes:[NSAttributedStringKey.font:UIFont.systemFont(ofSize:14), .foregroundColor: UIColor.orange.withAlphaComponent(0.8)]))
        textField.attributedPlaceholder = placeHolder
        textField.setAnchor(width: 0, height: 40)
        textField.setLeftPaddingPoints(10)
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 1, green: 102/255, blue: 0, alpha: 1).cgColor
        textField.layer.cornerRadius = 5
        textField.textColor = .black
        textField.font = UIFont.boldSystemFont(ofSize: 14)
        textField.autocorrectionType = .no
        var placeHolder = NSMutableAttributedString()
        placeHolder = NSMutableAttributedString(attributedString: NSAttributedString(string:"Password", attributes:[NSAttributedStringKey.font:UIFont.systemFont(ofSize:14), .foregroundColor: UIColor.orange.withAlphaComponent(0.8)]))
        textField.attributedPlaceholder = placeHolder
        textField.setAnchor(width: 0, height: 40)
        textField.setLeftPaddingPoints(10)
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        let attString = NSMutableAttributedString(attributedString: NSAttributedString(string:"Login", attributes:[NSAttributedStringKey.font:UIFont.systemFont(ofSize:16), .foregroundColor: UIColor.white]))
        button.setAttributedTitle(attString, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 1, green: 102/255, blue: 0, alpha: 1).cgColor
        button.backgroundColor = UIColor(red: 1, green: 102/255, blue: 0, alpha: 1)
        button.setAnchor(width: 0, height: 50)
        return button
    }()
    
    // MARK: - Components arrangement
    func mainStackView() -> UIStackView{
        let stackView = UIStackView(arrangedSubviews:[emailTextField,
                                                      passwordTextField,
                                                      loginButton])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
    }
}
