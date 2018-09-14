//
//  UserDefaultsManager.swift
//  idwall_desafios_iddog
//
//  Created by Lucas de Brito on 14/09/2018.
//  Copyright © 2018 Lucas de Brito. All rights reserved.
//

import Foundation

struct Keys {
    struct Authentication {
        static let isLoggedIn = "isLoggedIn"
        static let token = "token"
    }
    
    private init(){}
}

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private init(){}
    
    var isLoggedIn: Bool{
        get {
            return UserDefaults.standard.bool(forKey: Keys.Authentication.isLoggedIn)
        }
        set{
            return UserDefaults.standard.set(newValue, forKey: Keys.Authentication.isLoggedIn)
        }
    }
    
    var token: String{
        get{
            return UserDefaults.standard.string(forKey: Keys.Authentication.token)!
        }
        set{
            return UserDefaults.standard.set(newValue, forKey: Keys.Authentication.token)
        }
    }
}
