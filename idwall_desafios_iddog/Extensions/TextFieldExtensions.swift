//
//  TextFieldExtensions.swift
//  idwall_desafios_iddog
//
//  Created by Lucas de Brito on 12/09/2018.
//  Copyright © 2018 Lucas de Brito. All rights reserved.
//

import UIKit

extension UITextField{
    
    public convenience init(placeHolder:String, borderColor:UIColor){
        self.init()
        self.layer.borderWidth = 1
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = 5
        self.textColor = .black
        self.font = UIFont.boldSystemFont(ofSize: 15)
        self.textColor = UIColor.customOrange
        self.autocorrectionType = .no
        var placeholder = NSMutableAttributedString()
        placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string:placeHolder, attributes:[NSAttributedStringKey.font:UIFont.systemFont(ofSize:14), .foregroundColor: UIColor.orange.withAlphaComponent(0.8)]))
        self.attributedPlaceholder = placeholder
        self.setAnchor(width: 0, height: 40)
        self.setLeftPaddingPoints(10)
        self.keyboardType = .emailAddress
        self.autocapitalizationType = .none
        self.autocorrectionType = .no
    }
    
}
