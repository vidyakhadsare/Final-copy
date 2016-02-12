//
//  mbrViewController.swift
//  ImmunizationRecord
//
//  Created by Anhad S Bhasin on 1/5/16.
//  Copyright © 2016 Anhad S Bhasin. All rights reserved.
//

import UIKit

class mbrViewController: UITableViewController {
    let date = NSDate()
    let formatter = NSDateFormatter()
    let mbrDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var mbrD1DateGiven: UITextField!
    
    @IBOutlet weak var mbrD1DoctorOffice: UITextField!
    
    @IBOutlet weak var mbrD1DueDate: UITextField!
    
    
    
    @IBOutlet weak var mbrD2DateGiven: UITextField!
    
    @IBOutlet weak var mbrD2DoctorOffice: UITextField!
    
    @IBOutlet weak var mbrD2DueDate: UITextField!
    
    
    
    @IBOutlet weak var mbrD3DateGiven: UITextField!
    
    @IBOutlet weak var mbrDoctorOffice: UITextField!
    
    @IBOutlet weak var mbrD3DueDate: UITextField!
    
    @IBAction func mbrSave(sender: UIBarButtonItem) {
        
        mbrDefaults.setObject(mbrD1DateGiven.text, forKey: "mbrD1DateGiven")
        mbrDefaults.setObject(mbrD1DoctorOffice.text, forKey: "mbrD1DoctorOffice")
        mbrDefaults.setObject(mbrD1DueDate.text, forKey: "mbrD1DueDate")
        
        mbrDefaults.setObject(mbrD2DateGiven.text, forKey: "mbrD2DateGiven")
        mbrDefaults.setObject(mbrD2DoctorOffice.text, forKey: "mbrD2DoctorOffice")
        mbrDefaults.setObject(mbrD2DueDate.text, forKey: "mbrD2DueDate")
        
        mbrDefaults.setObject(mbrD3DateGiven.text, forKey: "mbrD3DateGiven")
        mbrDefaults.setObject(mbrDoctorOffice.text, forKey: "mbrDoctorOffice")
        mbrDefaults.setObject(mbrD3DueDate.text, forKey: "mbrD3DueDate")
        
        //Send Notifications
        if mbrDefaults.stringForKey("mbrD1DueDate")! != ""
        {
            sendNotification(mbrD1DueDate.text!  + " 10:00")
        }
        if (mbrDefaults.stringForKey("mbrD2DueDate")!) != ""
        {
            sendNotification(mbrD2DueDate.text!  + " 10:00")
        }
        if mbrDefaults.stringForKey("mbrD3DueDate")! != ""
        {
            sendNotification(mbrD3DueDate.text!  + " 10:00")
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
        notification.alertBody = "Your MBR vaccine is due in 2 days. Please call your Doctor. Thank You!"
        notification.fireDate = finalDate
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }

    
    @IBAction func mbrD2Same() {
        mbrD2DoctorOffice.text = mbrD1DoctorOffice.text
    }
    
    @IBAction func mbrD3Same() {
         mbrDoctorOffice.text = mbrD2DoctorOffice.text
    }
    
    @IBAction func mbrDGCD() {
        formatter.dateStyle = .ShortStyle
        mbrD1DateGiven.text = formatter.stringFromDate(date)
    }
    
    @IBAction func mbrD2DGCD() {
        formatter.dateStyle = .ShortStyle
        mbrD2DateGiven.text = formatter.stringFromDate(date)
    }
    
    @IBAction func mbrD3DGCD() {
        formatter.dateStyle = .ShortStyle
        mbrD3DateGiven.text = formatter.stringFromDate(date)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if mbrDefaults.stringForKey("mbrD1DateGiven") != nil
        {
            mbrD1DateGiven.text = mbrDefaults.stringForKey("mbrD1DateGiven")
            mbrD1DoctorOffice.text = mbrDefaults.stringForKey("mbrD1DoctorOffice")
            mbrD1DueDate.text = mbrDefaults.stringForKey("mbrD1DueDate")
        
            
            mbrD2DateGiven.text = mbrDefaults.stringForKey("mbrD2DateGiven")
            mbrD2DoctorOffice.text = mbrDefaults.stringForKey("mbrD2DoctorOffice")
            mbrD2DueDate.text = mbrDefaults.stringForKey("mbrD2DueDate")
        
            
            mbrD3DateGiven.text = mbrDefaults.stringForKey("mbrD3DateGiven")
            mbrDoctorOffice.text = mbrDefaults.stringForKey("mbrDoctorOffice")
            mbrD3DueDate.text = mbrDefaults.stringForKey("mbrD3DueDate")
            
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
