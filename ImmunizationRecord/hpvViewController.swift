//
//  hpvViewController.swift
//  ImmunizationRecord
//
//  Created by Anhad S Bhasin on 1/5/16.
//  Copyright © 2016 Anhad S Bhasin. All rights reserved.
//

import UIKit

class hpvViewController: UITableViewController {
    let date = NSDate()
    let formatter = NSDateFormatter()
    let hpvDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var hpvD1DateGiven: UITextField!
    
    @IBOutlet weak var hpvDoctorOffice: UITextField!
    
    @IBOutlet weak var hpvDueDate: UITextField!
    
    
    
    
    @IBOutlet weak var hpvD2DateGiven: UITextField!
    
    
    @IBOutlet weak var hpvD2DoctorOffice: UITextField!
    
    @IBOutlet weak var hpvD2DueDate: UITextField!
    
    
    
    
    @IBOutlet weak var hpvD3DateGiven: UITextField!
    
    @IBOutlet weak var hpvD3DoctorOffice: UITextField!
    
    
    @IBOutlet weak var hpvD3DueDate: UITextField!
    
    
    @IBAction func hpvSave(sender: UIBarButtonItem) {
        
        hpvDefaults.setObject(hpvD1DateGiven.text, forKey: "hpvD1DateGiven")
        hpvDefaults.setObject(hpvDoctorOffice.text, forKey: "hpvDoctorOffice")
        hpvDefaults.setObject(hpvDueDate.text, forKey: "hpvDueDate")
        
        hpvDefaults.setObject(hpvD2DateGiven.text, forKey: "hpvD2DateGiven")
        hpvDefaults.setObject(hpvD2DoctorOffice.text, forKey: "hpvD2DoctorOffice")
        hpvDefaults.setObject(hpvD2DueDate.text, forKey: "hpvD2DueDate")
        
        hpvDefaults.setObject(hpvD3DateGiven.text, forKey: "hpvD3DateGiven")
        hpvDefaults.setObject(hpvD3DoctorOffice.text, forKey: "hpvD3DoctorOffice")
        hpvDefaults.setObject(hpvD3DueDate.text, forKey: "hpvD3DueDate")
        
        
        //Send Notifications
        if hpvDefaults.stringForKey("hpvDueDate")! != ""
        {
            sendNotification(hpvDueDate.text!  + " 10:00")
        }
        if (hpvDefaults.stringForKey("hpvD2DueDate")!) != ""
        {
            sendNotification(hpvD2DueDate.text!  + " 10:00")
        }
        if hpvDefaults.stringForKey("hpvD3DueDate")! != ""
        {
            sendNotification(hpvD3DueDate.text!  + " 10:00")
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
        notification.alertBody = "Your HPV vaccine is due in 2 days. Please call your Doctor. Thank You!"
        notification.fireDate = finalDate
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }
    
    @IBAction func hpvD2Same() {
        hpvD2DoctorOffice.text = hpvDoctorOffice.text
    }
    
    @IBAction func hpvD3Same() {
        hpvD3DoctorOffice.text = hpvD2DoctorOffice.text
    }
    
    @IBAction func hpvD1DGCD() {
        formatter.dateStyle = .ShortStyle
        hpvD1DateGiven.text = formatter.stringFromDate(date)
    }
    
    @IBAction func hpvD2DGCD() {
        formatter.dateStyle = .ShortStyle
        hpvD2DateGiven.text = formatter.stringFromDate(date)
    }
    
    @IBAction func hpvD3DGCD() {
        formatter.dateStyle = .ShortStyle
        hpvD3DateGiven.text = formatter.stringFromDate(date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if hpvDefaults.stringForKey("hpvD1DateGiven") != nil
        {
            hpvD1DateGiven.text = hpvDefaults.stringForKey("hpvD1DateGiven")
            hpvDoctorOffice.text = hpvDefaults.stringForKey("hpvDoctorOffice")
            hpvDueDate.text = hpvDefaults.stringForKey("hpvDueDate")
            
            hpvD2DateGiven.text = hpvDefaults.stringForKey("hpvD2DateGiven")
            hpvD2DoctorOffice.text = hpvDefaults.stringForKey("hpvD2DoctorOffice")
            hpvD2DueDate.text = hpvDefaults.stringForKey("hpvD2DueDate")
            
            hpvD3DateGiven.text = hpvDefaults.stringForKey("hpvD3DateGiven")
            hpvD3DoctorOffice.text = hpvDefaults.stringForKey("hpvD3DoctorOffice")
            hpvD3DueDate.text = hpvDefaults.stringForKey("hpvD3DueDate")
            
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
