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
    
    var name : String="";
    var date : Date=Date();
    var id: Int64=0
    
     let eventTable = Table("Event")
     let idFormat = Expression<Int64>("id")
     let nameFormat = Expression<String>("name")
     let dateFormat = Expression<Date>("date")
    
    let eventStatusTable = Table("EventStatus")
    let statusFormat = Expression<String>("Status")
    let idEventFormat = Expression<Int64>("idEvent")
    let idPlayerFormat = Expression<Int64>("idPlayer")
    
    
    init(){}
    
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
    
    func getDate() -> Date{
        return self.date;
    }
    
    func setDate(date:Date){
        self.date=date;
    }
    
    // save the object in database
    func saveNew(){
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
    
    func getEventForPlayer(playerToken: String) -> Array<Event>{
        
        let user1 = User()
        user1.loadByToken(token: playerToken)
        
        var eventList = [Event]()
        do{
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let db = try Connection("\(path)/db.sqlite3")
            
            let query = eventStatusTable.select(eventStatusTable[*]).filter(idPlayerFormat == user1.getId())
            
            for eventStatusItem in try db.prepare(query) {
                let query2 = eventTable.select(eventTable[*]).filter(idFormat == eventStatusItem[idEventFormat])
                for eventItem in try db.prepare(query2) {
                    let event1 = Event(name : eventItem[nameFormat],date :eventItem[dateFormat])
                    eventList.append(event1)
                }
            }
            
            
        }catch{
            print(error)
            
        }
        return eventList
        
    }
    
}
