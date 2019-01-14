//
//  Groupe.swift
//  RaiderCalendarIOS
//
//  Created by CUNHA MATTHIEU on 14/01/2019.
//  Copyright © 2019 VM. All rights reserved.
//

import Foundation


class Groupe{
    
    var name: String = "";
    var jointoken: String = "";
    
    init(name : String){
        self.name=name;
        self.jointoken=self.randomString(length: 8);
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
    }
    
}
