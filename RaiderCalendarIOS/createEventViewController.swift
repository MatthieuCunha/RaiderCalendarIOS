//
//  createEventViewController.swift
//  RaiderCalendarIOS
//
//  Created by CUNHA MATTHIEU on 14/01/2019.
//  Copyright © 2019 VM. All rights reserved.
//

import UIKit

class createEventViewController: UIViewController {

    @IBOutlet weak var eventName: UITextField!
    @IBOutlet weak var groupeName: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!

    var pickerData: [String] = [String]()
    var selectedGroupe: Int=0
    var groupList: [Groupe]=[Groupe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let user1 = User()
        groupList = user1.getGroupeList(userToken: Token.token)
        
        for group in groupList{
            pickerData.append(group.getName())
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // load code
         pickerData = [String]()
        let user1 = User()
        groupList = user1.getGroupeList(userToken: Token.token)
        
        for group in groupList{
            pickerData.append(group.getName())
        }
        groupeName.reloadAllComponents()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        self.selectedGroupe=row
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return pickerData.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return pickerData[row]
    }
    
    
    
    @IBAction func createEventClick(_ sender: UIButton) {
        
        let event = Event(name: eventName.text!,date: datePicker.date)
        event.save()
        let groupe = groupList[selectedGroupe]
        let eventStatus = EventStatus()
        eventStatus.inviteGroupe(eventId: event.getId(),groupeId: groupe.getId())
        
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
