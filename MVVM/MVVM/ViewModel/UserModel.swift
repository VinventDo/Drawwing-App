//
//  UserModel.swift
//  MVVM
//
//  Created by Thế Châu on 8/29/18.
//  Copyright © 2018 Thế Châu. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class userModel{
    var user: Variable<[User]> = Variable([])
    func appendData(index: Int){
        user.value.append(User(name: "Chau\(index)", age: index))
    }
    
    func getData(index: Int) -> User{
        return user.value[index]
    }
    
    func getTotal() -> Int{
        return user.value.count
    }
}
