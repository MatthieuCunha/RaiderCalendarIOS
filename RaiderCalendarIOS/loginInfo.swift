//
//  loginInfo.swift
//  RaiderCalendarIOS
//
//  Created by CUNHA MATTHIEU on 21/01/2019.
//  Copyright © 2019 VM. All rights reserved.
//

import Foundation
import SQLite

class loginInfo{
    
    var playerId: Int64=0
    var salt: String = ""
    var password: String=""
    
    let idFormat = Expression<Int64>("id")
    let nameFormat = Expression<String>("name")
    let tokenFormat = Expression<String>("token")
    let passwordFormat = Expression<String>("password")
    let saltFormat = Expression<String>("salt")
    let usersTable = Table("User")
    let loginInfoTable = Table("LoginInfo")
    
    
    init(playerId: Int64, password: String){
        self.playerId=playerId
        self.password=self.hash(pass: password)
    }
    
    func hash(pass: String) -> String{
        var hashPass=""
     
        
        
        
        
        return hashPass
    }
    
    func loadByLogin(login: String){
        
    }
    
    func save(){
        
    }
    
    
}
