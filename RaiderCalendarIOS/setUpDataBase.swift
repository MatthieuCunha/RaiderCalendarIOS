//
//  setUpDataBase.swift
//  RaiderCalendarIOS
//
//  Created by CUNHA MATTHIEU on 14/01/2019.
//  Copyright © 2019 VM. All rights reserved.
//

import Foundation
import SQLite


func setUpDB() -> Void{
    let path = NSSearchPathForDirectoriesInDomains(
        .documentDirectory, .userDomainMask, true
        ).first!
    
    do{
    let db = try Connection("\(path)/db.sqlite3")
    
        let users = Table("User")
        let loginInfo = Table("LoginInfo")
        let groupe = Table("Groupe")
        let event = Table("Event")
        let eventStatus = Table("EventStatus")
        let groupeMembers = Table("GroupeMembers")
        
        try db.run(users.drop(ifExists: true))
        try db.run(loginInfo.drop(ifExists: true))
        try db.run(groupe.drop(ifExists: true))
        try db.run(event.drop(ifExists: true))
        try db.run(eventStatus.drop(ifExists: true))
         try db.run(groupeMembers.drop(ifExists: true))
    
        
        let id = Expression<Int64>("id")
        let name = Expression<String>("name")
        let token = Expression<String>("token")

        
  
    try db.run(users.create { t in     // CREATE TABLE "users" (
        t.column(id, primaryKey: .autoincrement) //     "id" INTEGER PRIMARY KEY NOT NULL,
        t.column(name, unique: true)
        t.column(token)
    })
        
        
        let password = Expression<String>("password")
        let salt = Expression<String>("salt")
        
        try db.run(loginInfo.create { t in
            t.column(id, primaryKey: true) //
            t.column(password)
            t.column(salt)
        })
        
        
        let jointoken = Expression<String>("jointoken")
        
        
        try db.run(groupe.create { t in     // CREATE TABLE "users" (
            t.column(id, primaryKey: .autoincrement) //     "id" INTEGER PRIMARY KEY NOT NULL,
            t.column(name)  //     "email" TEXT UNIQUE NOT NULL,
            t.column(jointoken)                 //     "name" TEXT
        })
        
        
        let date = Expression<Date>("date")
        
        
        try db.run(event.create { t in     // CREATE TABLE "users" (
            t.column(id, primaryKey: .autoincrement) //     "id" INTEGER PRIMARY KEY NOT NULL,
            t.column(name)  //     "email" TEXT UNIQUE NOT NULL,
            t.column(date)                 //     "name" TEXT
        })
        
        let status = Expression<String>("Status")
        let idEvent = Expression<Int64>("idEvent")
        let idPlayer = Expression<Int64>("idPlayer")
        
        
        try db.run(eventStatus.create { t in
            t.column(id, primaryKey: .autoincrement)
            t.column(idEvent)
            t.column(idPlayer)
            t.column(status)
        })
        
        
        let idGroupe = Expression<Int64>("idGroupe")

        
        
        try db.run(groupeMembers.create { t in
            t.column(id, primaryKey: .autoincrement)
            t.column(idGroupe)
            t.column(idPlayer)

        })
        
        
        // add some test value
        let user1 = User(name:"user1",token:"tmpToken",password: "test")
        user1.saveNew()
        let user2 = User(name:"user2",token:"token",password:"")
        user2.saveNew()
        let user3 = User(name:"user3",token:"token",password:"")
        user3.saveNew()
        let user4 = User(name:"user4",token:"token",password:"")
        user4.saveNew()
        let user5 = User(name:"user5",token:"token",password:"")
        user5.saveNew()
        
        //group setup
        let groupe1 = Groupe(name:"groupe1")
        groupe1.saveNew()
        let groupe2 = Groupe(name:"groupe2")
        groupe2.saveNew()
        
        let groupe3 = Groupe(name:"groupeTestToken")
        groupe3.setToken(token: "tokentest")
        groupe3.saveNew()
        
        // groupMember setup
        let groupeMember1=GroupeMember(idGroupe:groupe1.getId(),idPlayer:user1.getId())
        groupeMember1.saveNew()
        let groupeMember2=GroupeMember(idGroupe:groupe2.getId(),idPlayer:user1.getId())
        groupeMember2.saveNew()
        let groupeMember3=GroupeMember(idGroupe:groupe3.getId(),idPlayer:user2.getId())
        groupeMember3.saveNew()
        
        let groupeMember4=GroupeMember(idGroupe:groupe1.getId(),idPlayer:user3.getId())
        groupeMember4.saveNew()
        let groupeMember5=GroupeMember(idGroupe:groupe1.getId(),idPlayer:user4.getId())
        groupeMember5.saveNew()
        let groupeMember6=GroupeMember(idGroupe:groupe1.getId(),idPlayer:user5.getId())
        groupeMember6.saveNew()
    
} catch {
    //handle error
    print(error)
}
    
}


