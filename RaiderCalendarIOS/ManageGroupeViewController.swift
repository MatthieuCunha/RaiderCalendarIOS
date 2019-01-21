//
//  ManageGroupeViewController.swift
//  RaiderCalendarIOS
//
//  Created by CUNHA MATTHIEU on 14/01/2019.
//  Copyright © 2019 VM. All rights reserved.
//

import UIKit
import Foundation
import SQLite

class ManageGroupeViewController: UIViewController {

    
    @IBOutlet weak var groupeName: UITextField!
    @IBOutlet weak var groupeToken: UITextField!
    @IBOutlet weak var containerView: UIView!
    
    let groupe = Table("Groupe")
    let groupeMembers = Table("GroupeMembers")
    let id = Expression<Int64>("id")
    let name = Expression<String>("name")
    let jointoken = Expression<String>("jointoken")
    let idPlayer = Expression<Int64>("idPlayer")
    let idGroupe = Expression<Int64>("idGroupe")
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let user1 = User()
        let groupList = user1.getGroupeList(userToken: Token.token)
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func createGroupeButton(_ sender: UIButton) {
        
        let groupe1 = Groupe(name:groupeName.text!)
        groupe1.saveNew()
        
        let user1 = User()
        user1.loadByToken(token: Token.token)
        
        let groupeMember1=GroupeMember(idGroupe:groupe1.getId(),idPlayer:user1.getId())
        groupeMember1.saveNew()
        
        var tv : GroupeTableViewController = self.childViewControllers[0] as! GroupeTableViewController
        tv.viewWillAppear(true)
        
        
    }
    
    @IBAction func joinGroupeClick(_ sender: UIButton) {
        
        let groupJoinToken = groupeToken.text
        let user1 = User()
        user1.loadByToken(token: Token.token)
        let groupe1 = Groupe(name: "")
        let exist = groupe1.getByToken(token: groupJoinToken!)
        
        if(exist){
            groupe1.addMember(playerId:user1.getId())
            
            var tv : GroupeTableViewController = self.childViewControllers[0] as! GroupeTableViewController
            tv.viewWillAppear(true)
            
        }else{
            // popup ?
        }
        
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
