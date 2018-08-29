//
//  ApiService.swift
//  MVVM
//
//  Created by Thế Châu on 8/29/18.
//  Copyright © 2018 Thế Châu. All rights reserved.
//

import Foundation
import Alamofire
class BaseAPI: NSObject {
    // Properties
    internal var apiName = ""
    // Functions
    init (apiName: String){
        self.apiName = apiName
    }
    
    // Request action
    func callAction(action: String, methodName: Alamofire.HTTPMethod, params: Dictionary<String, AnyObject>, callback: @escaping (_ response: Dictionary<String, AnyObject>, _ status: GvHttpStatus)->Void) {
        
        // Check isDebug variable to use production server or dev server.
        let serverURL = ("\(Constant.ApiSever.url)/\(apiName)\(action)")
        let headers = [
            "Content-Type": "application/json",
            "Login-User-Type": "Student"
        ]
//        if LocalStorage.getValueWithKey(key: "token") is String && LocalStorage.getValueWithKey(key: "token") as! String != "" {
//            headers.updateValue((LocalStorage.getValueWithKey(key: "token") as! String), forKey: "Authorization")
//        }
        // TODO: Setting timeout for alamofire
        Alamofire.SessionManager.default.session.configuration.timeoutIntervalForRequest = 120
        if methodName != .get {
            Alamofire.request(serverURL, method: methodName, parameters: params, encoding: JSONEncoding.default, headers: headers ).responseJSON{ response in
                
//                if response.result.isSuccess {
//                    // Working connect server
//                    if response.response?.statusCode == 204{
//                        callback(Dictionary<String, AnyObject>(), GvHttpStatus.Success)
//                    }
//                    if response.response?.statusCode == 200 || response.response?.statusCode == 201 {
//                        callback(response.result.value as! Dictionary<String, AnyObject>, GvHttpStatus.Success)
//                    } else if response.response?.statusCode == 401 {
//                        callback(Dictionary<String, AnyObject>(), GvHttpStatus.Unauthorized)
//                    } else if response.response?.statusCode == 403 {
//                        callback(response.result.value as! Dictionary<String, AnyObject>, GvHttpStatus.Forbidden)
//                    } else if response.response?.statusCode == 404 {
//                        callback(Dictionary<String, AnyObject>(), GvHttpStatus.NotFound)
//                    } else if response.response?.statusCode == 409 {
//                        callback(Dictionary<String, AnyObject>(), GvHttpStatus.Conflict)
//                    } else if response.response?.statusCode == 503 {
//                        callback(response.result.value as! Dictionary<String, AnyObject>, GvHttpStatus.Maintenance)
//                        if let res   = response.result.value as? Dictionary<String, AnyObject>{
//                            let myDict = [ "message": res.stringForKey(forKey: "message"), "start_time":res.stringForKey(forKey: "start_time"), "end_time":res.stringForKey(forKey: "end_time")]
//                            postNotification(name: .serverMaintenance, object: myDict as AnyObject)
//                        }
//                    }else {
//                        callback(Dictionary<String, AnyObject>(), GvHttpStatus.ServerError)
//                    }
//                }else{
//
//                    if response.response?.statusCode == 401 {
//                        callback(Dictionary<String, AnyObject>(), GvHttpStatus.Unauthorized)
//                    }else{
//                        callback(Dictionary<String, AnyObject>(), GvHttpStatus.ServerError)
//                        DispatchQueue.main.async(execute: { () -> Void in
//                            SVProgressHUD.dismiss()
//                            //there are error view will trans to ErrorNetworkView
//                            if response.response?.statusCode != 401 && !fromLogin!{
//                                postNotification(name: .errorNetworktimeOut)
//                            }
//                        })
//                    }
//                }
                
                
            }
        }else {
            
            Alamofire.request(serverURL, method: methodName, parameters: nil, encoding: JSONEncoding.default, headers: headers ).responseJSON{ response in
                
//                if response.result.isSuccess {
//                    if response.response?.statusCode == 204{
//                        callback(Dictionary<String, AnyObject>(), GvHttpStatus.Success)
//                    }
//                    // Connect with server
//                    if response.response?.statusCode == 200 || response.response?.statusCode == 201 {
//                        callback(response.result.value as! Dictionary<String, AnyObject>, GvHttpStatus.Success)
//                        return
//                    } else if response.response?.statusCode == 401 {
//                        callback(Dictionary<String, AnyObject>(), GvHttpStatus.Unauthorized)
//                    } else if response.response?.statusCode == 403 {
//                        callback(Dictionary<String, AnyObject>(), GvHttpStatus.Forbidden)
//                    } else if response.response?.statusCode == 404 {
//                        callback(Dictionary<String, AnyObject>(), GvHttpStatus.NotFound)
//                    } else if response.response?.statusCode == 409 {
//                        callback(Dictionary<String, AnyObject>(), GvHttpStatus.Conflict)
//                    } else if response.response?.statusCode == 503 {
//                        callback(response.result.value as! Dictionary<String, AnyObject>, GvHttpStatus.Maintenance)
//                        if let res   = response.result.value as? Dictionary<String, AnyObject>{
//                            if fromMaintenance!{
//                                self.delegate    = controller
//                                self.delegate.updateTime(text: res.stringForKey(forKey: "time"))
//                            }else{
//                                let myDict = [ "message": res.stringForKey(forKey: "message"), "start_time":res.stringForKey(forKey: "start_time"), "end_time":res.stringForKey(forKey: "end_time")]
//                                postNotification(name: .serverMaintenance, object: myDict as AnyObject)
//                            }
//                        }
//                    }else {
//                        callback(Dictionary<String, AnyObject>(), GvHttpStatus.ServerError)
//                    }
//                }else{
//                    if response.response?.statusCode == 401 {
//                        callback(Dictionary<String, AnyObject>(), GvHttpStatus.Unauthorized)
//                    }else{
//                        callback(Dictionary<String, AnyObject>(), GvHttpStatus.ServerError)
//                        DispatchQueue.main.async(execute: { () -> Void in
//                            SVProgressHUD.dismiss()
//                            //there are error view will trans to ErrorNetworkView
//                            if response.response?.statusCode != 401 && !fromLogin!{
//                                postNotification(name: .errorNetworktimeOut)
//                            }
//                        })
//                    }
//
//                }
                
                
            }
        }
        
    }
}

enum GvHttpStatus {
    case Success
    case Unauthorized
    case Forbidden
    case NotFound
    case Conflict
    case ServerError
    case Maintenance
}

protocol JsonConvert {
    func toDict() -> Dictionary<String, AnyObject>
    func fromDict(data: Dictionary<String, AnyObject>)
}
