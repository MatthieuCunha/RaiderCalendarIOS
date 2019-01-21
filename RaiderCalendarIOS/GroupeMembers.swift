//
//  GroupeMembers.swift
//  RaiderCalendarIOS
//
//  Created by CUNHA MATTHIEU on 14/01/2019.
//  Copyright © 2019 VM. All rights reserved.
//

import Foundation
import SQLite


// class de jointure car je fais pas confiance aux relation many-many automatique
class GroupeMember{
    
    var idGroupe: Int64 = 0;
    var idPlayer: Int64 = 0;
    
    let groupeMembersTable = Table("GroupeMembers")
    let idGroupeFormat = Expression<Int64>("idGroupe")
    let idPlayerFormat = Expression<Int64>("idPlayer")
    
    
    init(){}
    
    init(idGroupe : Int64,idPlayer: Int64){
        self.idGroupe=idGroupe;
        self.idPlayer=idPlayer;
    }
    
    
    func getIdGroupe() -> Int64{
        return self.idGroupe;
    }
    
    func setIdGroupe(idGroupe:Int64){
        self.idGroupe=idGroupe;
    }
    
    func getIdPlayer() -> Int64{
        return self.idPlayer;
    }
    
    func setIdPlayer(idPlayer:Int64){
        self.idPlayer=idPlayer;
    }
    
    
    // save the object in database
    // save the object in database
    func saveNew(){
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        
        do{
            let db = try Connection("\(path)/db.sqlite3")
            try db.run(groupeMembersTable.insert(idGroupeFormat <- idGroupe, idPlayerFormat <- idPlayer))
        } catch {
            //handle error
            print(error)
        }
    }
    
    func getMembersId(groupId: Int64) -> [Int64]{
        var memberListId: [Int64] = [Int64]()
        do{
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let db = try Connection("\(path)/db.sqlite3")
            
            let query = groupeMembersTable.select(groupeMembersTable[*])//.filter(idGroupeFormat == groupId)
            
            for groupeMemberItem in try db.prepare(query) {
                memberListId.append(groupeMemberItem[idPlayerFormat])
            }

            return memberListId
        } catch {
            //handle error
            print(error)
            return [0]
        }
        
        
    }
        
        
    // load this object from databse
    func loadByParameter(paramName : String, paramValue : String,paramName2 : String, paramValue2 : String){
    
    
    }
    
    
}
