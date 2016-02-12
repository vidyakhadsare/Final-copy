//
//  VaricellaViewController.swift
//  ImmunizationRecord
//
//  Created by Anhad S Bhasin on 1/5/16.
//  Copyright © 2016 Anhad S Bhasin. All rights reserved.
//

import UIKit

class VaricellaViewController: UITableViewController {
    let date = NSDate()
    let formatter = NSDateFormatter()
    let varDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var varD1DateGiven: UITextField!
    
    @IBOutlet weak var varD1DoctorOffice: UITextField!
    
    @IBOutlet weak var varD1DueDate: UITextField!
    
    
    
    
    
    @IBOutlet weak var varD2DateGiven: UITextField!
    
    @IBOutlet weak var varD2DoctorOffice: UITextField!
    
    @IBOutlet weak var varD2DueDate: UITextField!
    
    
    
    
    
    @IBOutlet weak var varD3DateGiven: UITextField!
    
    @IBOutlet weak var varD3DoctorOffice: UITextField!
    
    @IBOutlet weak var varD3DueDate: UITextField!
    
    @IBAction func varSave(sender: UIBarButtonItem) {
        
        varDefaults.setObject(varD1DateGiven.text, forKey: "varD1DateGiven")
        varDefaults.setObject(varD1DoctorOffice.text, forKey: "varD1DoctorOffice")
        varDefaults.setObject(varD1DueDate.text, forKey: "varD1DueDate")
        
        varDefaults.setObject(varD2DateGiven.text, forKey: "varD2DateGiven")
        varDefaults.setObject(varD2DoctorOffice.text, forKey: "varD2DoctorOffice")
        varDefaults.setObject(varD2DueDate.text, forKey: "varD2DueDate")
        
        varDefaults.setObject(varD3DateGiven.text, forKey: "varD3DateGiven")
        varDefaults.setObject(varD3DoctorOffice.text, forKey: "varD3DoctorOffice")
        varDefaults.setObject(varD3DueDate.text, forKey: "varD3DueDate")
        
        
        //Send Notifications
        if varDefaults.stringForKey("varD1DueDate")! != ""
        {
            sendNotification(varD1DueDate.text!  + " 10:00")
        }
        if (varDefaults.stringForKey("varD2DueDate")!) != ""
        {
            sendNotification(varD2DueDate.text!  + " 10:00")
        }
        if varDefaults.stringForKey("varD3DueDate")! != ""
        {
            sendNotification(varD3DueDate.text!  + " 10:00")
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
        notification.alertBody = "Your Varicella vaccine is due in 2 days. Please call your Doctor. Thank You!"
        notification.fireDate = finalDate
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }
    
    
    @IBAction func varD2Same() {
        varD2DoctorOffice.text = varD1DoctorOffice.text
    }
    
    @IBAction func varD3Same() {
        varD3DoctorOffice.text = varD2DoctorOffice.text
    }
    
    @IBAction func varD1DGCD() {
        formatter.dateStyle = .ShortStyle
        varD1DateGiven.text = formatter.stringFromDate(date)
        
    }
    
    @IBAction func varD2DGCD() {
        formatter.dateStyle = .ShortStyle
        varD2DateGiven.text = formatter.stringFromDate(date)
    }
    
    @IBAction func varD3DGCD() {
        formatter.dateStyle = .ShortStyle
        varD3DateGiven.text = formatter.stringFromDate(date)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if varDefaults.stringForKey("varD1DateGiven") != nil
        {
            varD1DateGiven.text = varDefaults.stringForKey("varD1DateGiven")
            varD1DoctorOffice.text = varDefaults.stringForKey("varD1DoctorOffice")
            varD1DueDate.text = varDefaults.stringForKey("varD1DueDate")
   
            varD2DateGiven.text = varDefaults.stringForKey("varD2DateGiven")
            varD2DoctorOffice.text = varDefaults.stringForKey("varD2DoctorOffice")
            varD2DueDate.text = varDefaults.stringForKey("varD2DueDate")
   
            varD3DateGiven.text = varDefaults.stringForKey("varD3DateGiven")
            varD3DoctorOffice.text = varDefaults.stringForKey("varD3DoctorOffice")
            varD3DueDate.text = varDefaults.stringForKey("varD3DueDate")
            
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
