//
//  User.swift
//  MVVM
//
//  Created by Thế Châu on 8/29/18.
//  Copyright © 2018 Thế Châu. All rights reserved.
//

import Foundation
struct User{
    var name: String
    var age: Int
    
    func getName() -> String{
        return name
    }
    
    func getAge() -> String{
        return "\(age)"
    }
}
