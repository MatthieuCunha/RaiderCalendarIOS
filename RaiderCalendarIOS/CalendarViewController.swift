//
//  CalendarViewController.swift
//  RaiderCalendarIOS
//
//  Created by CUNHA MATTHIEU on 14/01/2019.
//  Copyright © 2019 VM. All rights reserved.
//

import UIKit

class CalendarViewController: UITableViewController {

    @IBOutlet var eventTableView: UITableView!
    var eventList = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
          self.eventList = Event().getEventForPlayer(playerToken: Token.token)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // load code
        self.eventList = Event().getEventForPlayer(playerToken: Token.token)
         self.eventTableView.reloadData()
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return eventList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! UITableViewCell
        cell.textLabel?.numberOfLines = 0
        let text = eventList[indexPath.item].getName() + "\n" + formatter.string(from:eventList[indexPath.item].getDate())
        cell.textLabel?.text = text
        return cell
        
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
