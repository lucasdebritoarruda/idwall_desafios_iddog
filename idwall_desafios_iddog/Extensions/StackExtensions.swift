//
//  StackExtensions.swift
//  idwall_desafios_iddog
//
//  Created by Lucas de Brito on 12/09/2018.
//  Copyright © 2018 Lucas de Brito. All rights reserved.
//

import UIKit

extension UIView{
    func createStackView(views:[UIView]) -> UIStackView {
        let stackview = UIStackView(arrangedSubviews: views)
        stackview.axis = .vertical
        stackview.distribution = .fillProportionally
        stackview.spacing = 10
        return stackview
    }
}
