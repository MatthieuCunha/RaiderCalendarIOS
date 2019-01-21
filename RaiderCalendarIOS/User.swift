//
//  User.swift
//  RaiderCalendarIOS
//
//  Created by CUNHA MATTHIEU on 14/01/2019.
//  Copyright © 2019 VM. All rights reserved.
//

import Foundation
import SQLite


class User{
    
    var name: String = ""
    var token: String = ""
    var id: Int64=0
    
    var tmpPass: String=""

    let idFormat = Expression<Int64>("id")
    let nameFormat = Expression<String>("name")
    let tokenFormat = Expression<String>("token")
    let idGroupeFormat = Expression<Int64>("idGroupe")
    let idPlayerFormat = Expression<Int64>("idPlayer")
    let users = Table("User")
    let groupe = Table("Groupe")
    let groupeMembers = Table("GroupeMembers")
         let jointokenFormat = Expression<String>("jointoken")
    
    
    init(){
    
    }
    
    init(name : String,token: String, password: String){
        self.name=name
        self.token=token
        self.tmpPass=password
        
    }
    
    
    func getName() -> String{
        return self.name
    }
    
    func setName(name:String){
        self.name=name
    }
    
    func getToken() -> String{
        return self.token
    }
    
    func setToken(token:String){
        self.token=token
    }
    
    func getId() -> Int64{
        return self.id
    }
    
    func setId(id:Int64){
        self.id=id
    }
    
    
    // save the object in database
    func saveNew(){
       
        do{
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let db = try Connection("\(path)/db.sqlite3")
            
            
            try db.run(users.insert(nameFormat <- name, tokenFormat <- token))
            self.id=db.lastInsertRowid
            
            loginInfo(playerId: self.id,password: self.tmpPass)
            
        } catch {
    //handle error
    print(error)
    }
        
}
    
    //update object in DB
    func update(){
    
    }
    
    
    func loadByToken(token:String){
        do{
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let db = try Connection("\(path)/db.sqlite3")
            
            let query = users.select(users[*])
                .filter(tokenFormat == token)
            let user = try db.pluck(query)
            
            self.id=user![idFormat]
            self.name=user![nameFormat]
            self.token=user![tokenFormat]
        } catch {
            //handle error
            print(error)
        }
        
    }
    
    
    func getGroupeList(userToken : String) -> Array<Groupe>{
        let user1 = User()
        user1.loadByToken(token: Token.token)
        
        var groupList = [Groupe]()
        do{
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let db = try Connection("\(path)/db.sqlite3")
            
            let query = groupeMembers.select(groupeMembers[*]).filter(idPlayerFormat == user1.getId())
            
            for groupeMemberItem in try db.prepare(query) {
              let query2 = groupe.select(groupe[*]).filter(idFormat == groupeMemberItem[idGroupeFormat])
              for groupeItem in try db.prepare(query2) {
                    let groupe1 = Groupe(name : groupeItem[nameFormat],token :groupeItem[jointokenFormat])
                    groupList.append(groupe1)
              }
            }
            
            
        }catch{print(error)}
        
        return groupList
    }
    
}
