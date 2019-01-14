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
    
    init(eventId:String,playerId:String,status:String){
        self.eventId=eventId;
        self.playerId=playerId;
        self.status=status;
        
        
    }
    
    
  /*  func getName() -> String{
        return self.name;
    }
    
    func setName(name:String){
        self.name=name;
    }
    
    func getToken() -> String{
        return self.jointoken;
    }
    
    func setToken(token:String){
        self.jointoken=token;
    }*/
    
    
}
