//
//  EventStatus.swift
//  RaiderCalendarIOS
//
//  Created by CUNHA MATTHIEU on 14/01/2019.
//  Copyright © 2019 VM. All rights reserved.
//

import Foundation


class EventStatus{
    
    var eventId:String;
    var playerId:String;
    var status:String;
    var role:String;
    
    init(eventId:String,playerId:String,role:String){
        self.eventId=eventId;
        self.playerId=playerId;
        self.status="PENDING";
        self.role=role;
        
        
    }
    
    
    func getEventId() -> String{
        return self.eventId;
    }
    
    func setEventId(eventId:String){
        self.eventId=eventId;
    }
    
    func getPlayerId() -> String{
        return self.playerId;
    }
    
    func setPlayerId(playerId:String){
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
    
    // save the object in database
    func save(){
        
        
    }
    
    // load this object from databse
    func loadByParameter(paramName : String, paramValue : String,paramName2 : String, paramValue2 : String){
        
        
    }
    
    
}
