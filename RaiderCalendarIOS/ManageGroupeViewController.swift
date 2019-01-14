//
//  ManageGroupeViewController.swift
//  RaiderCalendarIOS
//
//  Created by CUNHA MATTHIEU on 14/01/2019.
//  Copyright © 2019 VM. All rights reserved.
//

import UIKit
import SQLite

class ManageGroupeViewController: UIViewController {

    
    @IBOutlet weak var groupeName: UITextField!
    @IBOutlet weak var groupeToken: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let user1 = User()
        let groupList = user1.getGroupeList(userToken: Token.token)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createGroupeButton(_ sender: UIButton) {
    }
    @IBAction func joinGroupeClick(_ sender: UIButton) {
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
