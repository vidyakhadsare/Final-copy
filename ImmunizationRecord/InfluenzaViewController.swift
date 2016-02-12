//
//  InfluenzaViewController.swift
//  ImmunizationRecord
//
//  Created by Anhad S Bhasin on 1/5/16.
//  Copyright © 2016 Anhad S Bhasin. All rights reserved.
//

import UIKit

class InfluenzaViewController: UITableViewController {
    
    let date = NSDate()
    let formatter = NSDateFormatter()
    let infDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var infD1Dategiven: UITextField!
    
    @IBOutlet weak var infD1DoctorOffice: UITextField!
    
    @IBOutlet weak var infD1DueDate: UITextField!
    
    
    
    @IBOutlet weak var infD2Dategiven: UITextField!
    
    @IBOutlet weak var infD2DoctorOffice: UITextField!
    
    @IBOutlet weak var infD2DueDate: UITextField!
    

    
    @IBOutlet weak var infD3DateGiven: UITextField!
    
    @IBOutlet weak var infD3DoctorOffice: UITextField!
    
    @IBOutlet weak var infD3DueDate: UITextField!
    
    
    @IBAction func infSave(sender: UIBarButtonItem) {

        infDefaults.setObject(infD1Dategiven.text, forKey: "infD1Dategiven")
        infDefaults.setObject(infD1DoctorOffice.text, forKey: "infD1DoctorOffice")
        infDefaults.setObject(infD1DueDate.text, forKey: "infD1DueDate")
        
        infDefaults.setObject(infD2Dategiven.text, forKey: "infD2Dategiven")
        infDefaults.setObject(infD2DoctorOffice.text, forKey: "infD2DoctorOffice")
        infDefaults.setObject(infD2DueDate.text, forKey: "infD2DueDate")
        
        infDefaults.setObject(infD3DateGiven.text, forKey: "infD3DateGiven")
        infDefaults.setObject(infD3DoctorOffice.text, forKey: "infD3DoctorOffice")
        infDefaults.setObject(infD3DueDate.text, forKey: "infD3DueDate")
        
        //Send Notifications
        if infDefaults.stringForKey("infD1DueDate")! != ""
        {
            sendNotification(infD1DueDate.text!  + " 10:00")
        }
        if (infDefaults.stringForKey("infD2DueDate")!) != ""
        {
            sendNotification(infD2DueDate.text!  + " 10:00")
        }
        if infDefaults.stringForKey("infD3DueDate")! != ""
        {
            sendNotification(infD3DueDate.text!  + " 10:00")
        }
        
    }
    
    
    
    func sendNotification(dueDate:String)
    {
        let dateFormatter = NSDateFormatter()
        let dateAsString = dueDate
        //print("Date as string : \(dateAsString)")
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
        let newDate = dateFormatter.dateFromString(dateAsString)
        //print("New Date : \(newDate!)")
        let finalDate = newDate?.dateByAddingTimeInterval(-60*60*28*2)
        //print("Final Date : \(finalDate!)")
        let notification : UILocalNotification = UILocalNotification()
        notification.alertTitle = "VacWatch Alert"
        notification.alertBody = "Your Influenza vaccine is due in 2 days. Please call your Doctor. Thank You!"
        notification.fireDate = finalDate
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }

    
    
    @IBAction func infD2Same() {
        infD2DoctorOffice.text = infD1DoctorOffice.text
    }
    
    @IBAction func infD3Same() {
        infD3DoctorOffice.text = infD2DoctorOffice.text

    }
    
    @IBAction func infD1DGCD() {
        formatter.dateStyle = .ShortStyle
        infD1Dategiven.text = formatter.stringFromDate(date)
    }
    
    @IBAction func infD2DGCD() {
        formatter.dateStyle = .ShortStyle
        infD2Dategiven.text = formatter.stringFromDate(date)
    }
    
    @IBAction func infD3DGCD() {
        formatter.dateStyle = .ShortStyle
        infD3DateGiven.text = formatter.stringFromDate(date)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if infDefaults.stringForKey("infD1Dategiven") != nil
        {
            infD1Dategiven.text = infDefaults.stringForKey("infD1Dategiven")
            infD1DoctorOffice.text = infDefaults.stringForKey("infD1DoctorOffice")
            infD1DueDate.text = infDefaults.stringForKey("infD1DueDate")
            
            infD2Dategiven.text = infDefaults.stringForKey("infD2Dategiven")
            infD2DoctorOffice.text = infDefaults.stringForKey("infD2DoctorOffice")
            infD2DueDate.text = infDefaults.stringForKey("infD2DueDate")
            
            infD3DateGiven.text = infDefaults.stringForKey("infD3DateGiven")
            infD3DoctorOffice.text = infDefaults.stringForKey("infD3DoctorOffice")
            infD3DueDate.text = infDefaults.stringForKey("infD3DueDate")
            
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
/*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
