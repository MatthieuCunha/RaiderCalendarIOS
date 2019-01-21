//
//  EventStatus.swift
//  RaiderCalendarIOS
//
//  Created by CUNHA MATTHIEU on 14/01/2019.
//  Copyright © 2019 VM. All rights reserved.
//

import Foundation
import SQLite


class EventStatus{
    
    var eventId:Int64=0;
    var playerId:Int64=0;
    var status:String="";
    var role:String="";
    
    
    let eventStatusTable = Table("EventStatus")
    let id = Expression<Int64>("id")
    let statusFormat = Expression<String>("Status")
    let idEventFormat = Expression<Int64>("idEvent")
    let idPlayerFormat = Expression<Int64>("idPlayer")
    
    
    init(){}
    
    init(eventId:Int64,playerId:Int64,role:String){
        self.eventId=eventId;
        self.playerId=playerId;
        self.status="PENDING";
        self.role=role;
        
        
    }
    
    
    func getEventId() -> Int64{
        return self.eventId;
    }
    
    func setEventId(eventId:Int64){
        self.eventId=eventId;
    }
    
    func getPlayerId() -> Int64{
        return self.playerId;
    }
    
    func setPlayerId(playerId:Int64){
        self.playerId=playerId;
    }
    
    func getStatus() -> String{
        return self.status;
    }
    
    func setStatus(status:String){
        self.status=status;
    }
    
    func getRole() -> String{
        return self.role;
    }
    
    func setRole(role:String){
        self.role=role;
    }
    
    
    func inviteGroupe(eventId : Int64, groupeId: Int64){
        
        let playerList = GroupeMember().getMembersId(groupId: groupeId)
        for playerid in playerList{
            let eventStatus = EventStatus(eventId: eventId,playerId: playerid, role:"")
            eventStatus.saveNew()
        }
        
    }
    
    // save the object in database
    func saveNew(){
        do{
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let db = try Connection("\(path)/db.sqlite3")
            try db.run(eventStatusTable.insert(statusFormat <- status, idPlayerFormat <- playerId, idEventFormat <- eventId))
            
            //self.id=db.lastInsertRowid
        } catch {
            //handle error
            print(error)
        }
        
    }
    
    // load this object from databse
    func loadByParameter(paramName : String, paramValue : String,paramName2 : String, paramValue2 : String){
        
        
    }
    
    
}
