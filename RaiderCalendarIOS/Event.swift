//
//  Event.swift
//  RaiderCalendarIOS
//
//  Created by CUNHA MATTHIEU on 14/01/2019.
//  Copyright © 2019 VM. All rights reserved.
//

import Foundation
import SQLite

class Event{
    
    var name : String;
    var date : Date;
    var id: Int64=0
    
     let eventTable = Table("Event")
     let idFormat = Expression<Int64>("id")
     let nameFormat = Expression<String>("name")
     let dateFormat = Expression<Date>("date")
    
    
    
    init(name : String, date: Date){
        self.name=name;
        self.date=date;
    }
 
    func getId() -> Int64{
        return self.id;
    }
    
    func setId(id:Int64){
        self.id=id;
    }
    
    func getName() -> String{
        return self.name;
    }
    
    func setName(name:String){
        self.name=name;
    }
    
    func getToken() -> Date{
        return self.date;
    }
    
    func setToken(date:Date){
        self.date=date;
    }
    
    // save the object in database
    func save(){
        do{
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let db = try Connection("\(path)/db.sqlite3")
            try db.run(eventTable.insert(nameFormat <- name, dateFormat <- date))
            self.id=db.lastInsertRowid
        
        } catch {
            //handle error
            print(error)
        }
    }
    
    // load this object from databse
    func loadByParameter(paramName : String, paramValue : String,paramName2 : String, paramValue2 : String){
        
        
    }
    
    
}
