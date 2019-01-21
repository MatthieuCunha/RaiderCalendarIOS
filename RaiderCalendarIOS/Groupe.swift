//
//  Groupe.swift
//  RaiderCalendarIOS
//
//  Created by CUNHA MATTHIEU on 14/01/2019.
//  Copyright © 2019 VM. All rights reserved.
//

import Foundation
import SQLite

class Groupe{
    
    var name: String = ""
    var jointoken: String = ""
    var id: Int64=0
    
    let idFormat = Expression<Int64>("id")
    let groupeTable = Table("Groupe")
    let nameFormat = Expression<String>("name")
    let jointokenFormat = Expression<String>("jointoken")
    
    init(name : String){
        self.name=name
        self.jointoken=self.randomString(length: 8)
    }

    init(name : String,token : String){
        self.name=name
        self.jointoken=token;
    }
    
    
    func randomString(length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
    
    func getName() -> String{
        return self.name
    }
    
    func setName(name:String){
        self.name=name
    }
    
    func getToken() -> String{
        return self.jointoken
    }
    
    func setToken(token:String){
        self.jointoken=token
    }
    
    func getId() -> Int64{
        return self.id
    }
    
    func setId(id:Int64){
        self.id=id
    }
    
    // save the object in database
    func saveNew(){
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        
        do{
            let db = try Connection("\(path)/db.sqlite3")
            try db.run(groupeTable.insert(nameFormat <- name, jointokenFormat <- jointoken))
            self.id=db.lastInsertRowid
        } catch {
            //handle error
            print(error)
        }
        
    }
    
    func getByToken(token : String) ->Bool{
        
        do{
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let db = try Connection("\(path)/db.sqlite3")
            
            let query = groupeTable.select(groupeTable[*])
                .filter(jointokenFormat == token)
            let groupe = try db.pluck(query)
            
            if(groupe == nil){
                return false
            }
            
            self.id=groupe![idFormat]
            self.name=groupe![nameFormat]
            self.jointoken=groupe![jointokenFormat]
            
            return true
        } catch {
            //handle error
            print(error)
            return false
        }
        
    }
    
    func addMember(playerId : Int64){
        let groupeMember=GroupeMember(idGroupe: self.id,idPlayer: playerId)
        groupeMember.saveNew()
    }
    
    // load this object from databse
    func loadByParameter(paramName : String, paramValue : String,paramName2 : String, paramValue2 : String){
        
        
    }
    
}
