//
//  HaemophilusViewController.swift
//  ImmunizationRecord
//
//  Created by Anhad S Bhasin on 1/5/16.
//  Copyright © 2016 Anhad S Bhasin. All rights reserved.
//

import UIKit

class HaemophilusViewController: UITableViewController {
    let date = NSDate()
    let formatter = NSDateFormatter()
    let hivDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var hivD1DateGiven: UITextField!
    
    @IBOutlet weak var hivD1DoctorOffice: UITextField!
    
    @IBOutlet weak var hivD2DueDate: UITextField!
    
    @IBOutlet weak var hivD2DateGiven: UITextField!
    
    @IBOutlet weak var hivD2DoctorOffice: UITextField!
    
    @IBOutlet weak var hivD22DueDate: UITextField!
    
    @IBOutlet weak var hivD3DateGiven: UITextField!
    
    @IBOutlet weak var hivD3DoctorOffice: UITextField!
    
    @IBOutlet weak var hivD3DueDate: UITextField!
    
    
    @IBAction func hivSave(sender: UIBarButtonItem) {
        hivDefaults.setObject(hivD1DateGiven.text, forKey: "hivD1DateGiven")
        hivDefaults.setObject(hivD1DoctorOffice.text, forKey: "hivD1DoctorOffice")
        hivDefaults.setObject(hivD2DueDate.text, forKey: "hivD2DueDate")
 
        hivDefaults.setObject(hivD2DateGiven.text, forKey: "hivD2DateGiven")
        hivDefaults.setObject(hivD2DoctorOffice.text, forKey: "hivD2DoctorOffice")
        hivDefaults.setObject(hivD22DueDate.text, forKey: "hivD22DueDate")
 
        hivDefaults.setObject(hivD3DateGiven.text, forKey: "hivD3DateGiven")
        hivDefaults.setObject(hivD3DoctorOffice.text, forKey: "hivD3DoctorOffice")
        hivDefaults.setObject(hivD3DueDate.text, forKey: "hivD3DueDate")
        
        //Send Notifications
        if hivDefaults.stringForKey("hivD2DueDate")! != ""
        {
            sendNotification(hivD2DueDate.text!  + " 10:00")
        }
        if (hivDefaults.stringForKey("hivD22DueDate")!) != ""
        {
            sendNotification(hivD22DueDate.text!  + " 10:00")
        }
        if hivDefaults.stringForKey("hivD3DueDate")! != ""
        {
            sendNotification(hivD3DueDate.text!  + " 10:00")
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
        notification.alertBody = "Your Haemophilus vaccine is due in 2 days. Please call your Doctor. Thank You!"
        notification.fireDate = finalDate
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }

    
    @IBAction func hivD2Same() {
        hivD2DoctorOffice.text = hivD1DoctorOffice.text
    }
    
    
    @IBAction func hivD3Save() {
        hivD3DoctorOffice.text = hivD2DoctorOffice.text
    }
    
    @IBAction func hivD1DateGivenCurrentDate() {
        formatter.dateStyle = .ShortStyle
        hivD1DateGiven.text = formatter.stringFromDate(date)
    }
    
    @IBAction func hivD2DateGivenCurrentDate() {
        formatter.dateStyle = .ShortStyle
        hivD2DateGiven.text = formatter.stringFromDate(date)
    }
    
    
    @IBAction func hivD3DateGivenCurrentDate() {
        formatter.dateStyle = .ShortStyle
        hivD3DateGiven.text = formatter.stringFromDate(date)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if hivDefaults.stringForKey("hivD1DateGiven") != nil
        {
            hivD1DateGiven.text = hivDefaults.stringForKey("hivD1DateGiven")
            hivD1DoctorOffice.text = hivDefaults.stringForKey("hivD1DoctorOffice")
            hivD2DueDate.text = hivDefaults.stringForKey("hivD2DueDate")
            
            hivD2DateGiven.text = hivDefaults.stringForKey("hivD2DateGiven")
            hivD2DoctorOffice.text = hivDefaults.stringForKey("hivD2DoctorOffice")
            hivD22DueDate.text = hivDefaults.stringForKey("hivD22DueDate")
            
            hivD3DateGiven.text = hivDefaults.stringForKey("hivD3DateGiven")
            hivD3DoctorOffice.text = hivDefaults.stringForKey("hivD3DoctorOffice")
            hivD3DueDate.text = hivDefaults.stringForKey("hivD3DueDate")
            
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
