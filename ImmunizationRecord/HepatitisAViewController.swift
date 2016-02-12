//
//  HepatitisAViewController.swift
//  ImmunizationRecord
//
//  Created by Anhad S Bhasin on 1/5/16.
//  Copyright © 2016 Anhad S Bhasin. All rights reserved.
//

import UIKit

class HepatitisAViewController: UITableViewController {
    let date = NSDate()
    let formatter = NSDateFormatter()
    let hepaDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var hepaD1DateGiven: UITextField!
    
    @IBOutlet weak var hepaD1DoctorOffice: UITextField!
    
    @IBOutlet weak var hepaD1DueDate: UITextField!
    
    
    
    
    @IBOutlet weak var hepaD2DateGiven: UITextField!
    
    @IBOutlet weak var hepaD2DoctorOffice: UITextField!
    
    @IBOutlet weak var hepaD2DueDate: UITextField!
    
    
    
    @IBOutlet weak var hepaD2Dategiven: UITextField!
    
    @IBOutlet weak var hepaD3DoctorOffice: UITextField!
    
    @IBOutlet weak var hepaD3DueDate: UITextField!
    
    
    @IBAction func hepaSave(sender: UIBarButtonItem) {
        
        hepaDefaults.setObject(hepaD1DateGiven.text, forKey: "hepaD1DateGiven")
        hepaDefaults.setObject(hepaD1DoctorOffice.text, forKey: "hepaD1DoctorOffice")
        hepaDefaults.setObject(hepaD1DueDate.text, forKey: "hepaD1DueDate")
        
        hepaDefaults.setObject(hepaD2DateGiven.text, forKey: "hepaD2DateGiven")
        hepaDefaults.setObject(hepaD2DoctorOffice.text, forKey: "hepaD2DoctorOffice")
        hepaDefaults.setObject(hepaD2DueDate.text, forKey: "hepaD2DueDate")
        
        hepaDefaults.setObject(hepaD2Dategiven.text, forKey: "hepaD2Dategiven")
        hepaDefaults.setObject(hepaD3DoctorOffice.text, forKey: "hepaD3DoctorOffice")
        hepaDefaults.setObject(hepaD3DueDate.text, forKey: "hepaD3DueDate")
        
        
        //Send Notifications
        if hepaDefaults.stringForKey("hepaD1DueDate")! != ""
        {
            sendNotification(hepaD1DueDate.text!  + " 10:00")
        }
        if (hepaDefaults.stringForKey("hepaD2DueDate")!) != ""
        {
            sendNotification(hepaD2DueDate.text!  + " 10:00")
        }
        if hepaDefaults.stringForKey("hepaD3DueDate")! != ""
        {
            sendNotification(hepaD3DueDate.text!  + " 10:00")
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
        notification.alertBody = "Your Hepatitis A vaccine is due in 2 days. Please call your Doctor. Thank You!"
        notification.fireDate = finalDate
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }
    
    @IBAction func hepaD2Same() {
        hepaD2DoctorOffice.text = hepaD1DoctorOffice.text
    }
    
    
    @IBAction func hepaD3Same() {
        hepaD3DoctorOffice.text = hepaD2DoctorOffice.text
    }
    
    
    @IBAction func hepaD1DGCD() {
        formatter.dateStyle = .ShortStyle
        hepaD1DateGiven.text = formatter.stringFromDate(date)
        
    }
    
    @IBAction func hepaD2GDCD() {
        formatter.dateStyle = .ShortStyle
        hepaD2DateGiven.text = formatter.stringFromDate(date)
    }

    @IBAction func hepaD3DGCD() {
        formatter.dateStyle = .ShortStyle
        hepaD2Dategiven.text = formatter.stringFromDate(date)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if hepaDefaults.stringForKey("hepaD1DateGiven") != nil
        {
            hepaD1DateGiven.text = hepaDefaults.stringForKey("hepaD1DateGiven")
            hepaD1DoctorOffice.text = hepaDefaults.stringForKey("hepaD1DoctorOffice")
            hepaD1DueDate.text = hepaDefaults.stringForKey("hepaD1DueDate")
            
            hepaD2DateGiven.text = hepaDefaults.stringForKey("hepaD2DateGiven")
            hepaD2DoctorOffice.text = hepaDefaults.stringForKey("hepaD2DoctorOffice")
            hepaD2DueDate.text = hepaDefaults.stringForKey("hepaD2DueDate")
            
            hepaD2Dategiven.text = hepaDefaults.stringForKey("hepaD2Dategiven")
            hepaD3DoctorOffice.text = hepaDefaults.stringForKey("hepaD3DoctorOffice")
            hepaD3DueDate.text = hepaDefaults.stringForKey("hepaD3DueDate")
            
            
            
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
