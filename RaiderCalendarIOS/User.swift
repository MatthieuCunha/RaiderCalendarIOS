//
//  User.swift
//  RaiderCalendarIOS
//
//  Created by CUNHA MATTHIEU on 14/01/2019.
//  Copyright © 2019 VM. All rights reserved.
//

import Foundation


class User{
    
    var name: String = "";
    var token: String = "";
    
    init(name : String,token: String){
        self.name=name;
        self.token=token;
    }
    
    
    func getName() -> String{
        return self.name;
    }
    
    func setName(name:String){
        self.name=name;
    }
    
    func getToken() -> String{
        return self.token;
    }
    
    func setToken(token:String){
        self.token=token;
    }
    
}
