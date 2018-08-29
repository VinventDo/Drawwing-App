//
//  SignInAPI.swift
//  MVVM
//
//  Created by Thế Châu on 8/29/18.
//  Copyright © 2018 Thế Châu. All rights reserved.
//

import Foundation
class AuthAPI: BaseAPI {
    init() {
        super.init(apiName: "api/v1/students/auth")
    }
}


// MARK: - CALL SIGNIN API
extension AuthAPI {
    func callSignInAPI(email _email: String, password _password: String,callback _callback: @escaping (_ response: Dictionary<String,AnyObject>?, _ status: GvHttpStatus) -> Void) {
        var params      = Dictionary<String, AnyObject>()
        var authParams  = Dictionary<String, AnyObject>()
//        params.updateValue(_email       as AnyObject, forKey: "email")
//        params.updateValue(_password    as AnyObject, forKey: "password")
//        authParams.updateValue(params   as AnyObject, forKey: "auth")
//
//        let version  = UIDevice.current.systemVersion
//        var paramsPush      = Dictionary<String, AnyObject>()
//        paramsPush.updateValue(version as AnyObject, forKey: "os_version")
//        paramsPush.updateValue("IOS"   as AnyObject, forKey: "os")
//        paramsPush.updateValue(deviceTokenString   as AnyObject, forKey: "device_token")
//        authParams.updateValue(paramsPush as AnyObject, forKey: "device")
//        print(authParams)
        callAction(action: "/login", methodName: .post, params: params) { (result, status) -> Void in
            _callback(result, status)
        }
    }
}

extension AuthAPI {
    func callRegister(email _email: String, password _password: String,callback _callback: @escaping (_ response: Dictionary<String,AnyObject>?, _ status: GvHttpStatus) -> Void) {
        var params      = Dictionary<String, AnyObject>()
        var authParams  = Dictionary<String, AnyObject>()
        //        params.updateValue(_email       as AnyObject, forKey: "email")
        //        params.updateValue(_password    as AnyObject, forKey: "password")
        //        authParams.updateValue(params   as AnyObject, forKey: "auth")
        //
        //        let version  = UIDevice.current.systemVersion
        //        var paramsPush      = Dictionary<String, AnyObject>()
        //        paramsPush.updateValue(version as AnyObject, forKey: "os_version")
        //        paramsPush.updateValue("IOS"   as AnyObject, forKey: "os")
        //        paramsPush.updateValue(deviceTokenString   as AnyObject, forKey: "device_token")
        //        authParams.updateValue(paramsPush as AnyObject, forKey: "device")
        //        print(authParams)
        callAction(action: "/login", methodName: .post, params: params) { (result, status) -> Void in
            _callback(result, status)
        }
    }
}

extension AuthAPI {
    func callChangePass(email _email: String, password _password: String,callback _callback: @escaping (_ response: Dictionary<String,AnyObject>?, _ status: GvHttpStatus) -> Void) {
        var params      = Dictionary<String, AnyObject>()
        var authParams  = Dictionary<String, AnyObject>()
        //        params.updateValue(_email       as AnyObject, forKey: "email")
        //        params.updateValue(_password    as AnyObject, forKey: "password")
        //        authParams.updateValue(params   as AnyObject, forKey: "auth")
        //
        //        let version  = UIDevice.current.systemVersion
        //        var paramsPush      = Dictionary<String, AnyObject>()
        //        paramsPush.updateValue(version as AnyObject, forKey: "os_version")
        //        paramsPush.updateValue("IOS"   as AnyObject, forKey: "os")
        //        paramsPush.updateValue(deviceTokenString   as AnyObject, forKey: "device_token")
        //        authParams.updateValue(paramsPush as AnyObject, forKey: "device")
        //        print(authParams)
        callAction(action: "/login", methodName: .post, params: params) { (result, status) -> Void in
            _callback(result, status)
        }
    }
}




















