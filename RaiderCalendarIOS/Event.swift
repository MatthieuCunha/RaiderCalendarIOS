//
//  Event.swift
//  RaiderCalendarIOS
//
//  Created by CUNHA MATTHIEU on 14/01/2019.
//  Copyright © 2019 VM. All rights reserved.
//

import Foundation


class Event{
    
    var name : String;
    var date : Date;
    
    
    init(name : String, date: Date){
        self.name=name;
        self.date=date;
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
    
}
