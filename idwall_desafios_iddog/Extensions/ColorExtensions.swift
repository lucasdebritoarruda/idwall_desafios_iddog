//
//  ColorExtensions.swift
//  idwall_desafios_iddog
//
//  Created by Lucas de Brito on 12/09/2018.
//  Copyright © 2018 Lucas de Brito. All rights reserved.
//

import UIKit

extension UIColor{
    
    public convenience init(r:CGFloat, g:CGFloat, b:CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    static var customOrange: UIColor = {
        UIColor(r: 255, g: 102, b: 0)
    }()
}
