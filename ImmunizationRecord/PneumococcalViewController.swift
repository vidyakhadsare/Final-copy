//
//  PneumococcalViewController.swift
//  ImmunizationRecord
//
//  Created by Anhad S Bhasin on 1/5/16.
//  Copyright © 2016 Anhad S Bhasin. All rights reserved.
//

import UIKit

class PneumococcalViewController: UITableViewController {
    let date = NSDate()
    let formatter = NSDateFormatter()
    let pnDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var pnD1DateGiven: UITextField!
    
    
    @IBOutlet weak var pnD1DoctorOffice: UITextField!
    
    @IBOutlet weak var pnD1DueDate: UITextField!
    
    @IBOutlet weak var pnD2DateGiven: UITextField!
    
    @IBOutlet weak var pnD2DoctorOffice: UITextField!
    
    @IBOutlet weak var pnD2DueDate: UITextField!
    
    @IBOutlet weak var pnD3DateGiven: UITextField!
    
    @IBOutlet weak var pnD3DoctorOffice: UITextField!
    
    
    @IBOutlet weak var pnD3DueDate: UITextField!
    
    @IBAction func pnSave(sender: UIBarButtonItem) {
        
        pnDefaults.setObject(pnD1DateGiven.text, forKey: "pnD1DateGiven")
        pnDefaults.setObject(pnD1DoctorOffice.text, forKey: "pnD1DoctorOffice")
        pnDefaults.setObject(pnD1DueDate.text, forKey: "pnD1DueDate")
        
        pnDefaults.setObject(pnD2DateGiven.text, forKey: "pnD2DateGiven")
        pnDefaults.setObject(pnD2DoctorOffice.text, forKey: "pnD2DoctorOffice")
        pnDefaults.setObject(pnD2DueDate.text, forKey: "pnD2DueDate")
        
        pnDefaults.setObject(pnD3DateGiven.text, forKey: "pnD3DateGiven")
        pnDefaults.setObject(pnD3DoctorOffice.text, forKey: "pnD3DoctorOffice")
        pnDefaults.setObject(pnD3DueDate.text, forKey: "pnD3DueDate")
        
        //Send Notifications
        if pnDefaults.stringForKey("pnD1DueDate")! != ""
        {
            sendNotification(pnD1DueDate.text!  + " 10:00")
        }
        if (pnDefaults.stringForKey("pnD2DueDate")!) != ""
        {            
            sendNotification(pnD2DueDate.text!  + " 10:00")
        }
        if pnDefaults.stringForKey("pnD3DueDate")! != ""
        {
            sendNotification(pnD3DueDate.text!  + " 10:00")
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
        notification.alertBody = "Your Pneumococcal vaccine is due in 2 days. Please call your Doctor. Thank You!"
        notification.fireDate = finalDate
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }
    
    
    
    
    @IBAction func pnD2Same() {
        pnD2DoctorOffice.text = pnD1DoctorOffice.text
    }
    
    @IBAction func pnD3Same() {
        pnD3DoctorOffice.text = pnD2DoctorOffice.text
    }
    
    @IBAction func pnD1GDCD() {
        formatter.dateStyle = .ShortStyle
        pnD1DateGiven.text = formatter.stringFromDate(date)
    }
    
    @IBAction func pnD2GDCD() {
        formatter.dateStyle = .ShortStyle
        pnD2DateGiven.text = formatter.stringFromDate(date)
    }
    
    @IBAction func pnD3GDCD() {
        formatter.dateStyle = .ShortStyle
        pnD3DateGiven.text = formatter.stringFromDate(date)
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if pnDefaults.stringForKey("pnD1DateGiven") != nil
        {
            pnD1DateGiven.text = pnDefaults.stringForKey("pnD1DateGiven")
            pnD1DoctorOffice.text = pnDefaults.stringForKey("pnD1DoctorOffice")
            pnD1DueDate.text = pnDefaults.stringForKey("pnD1DueDate")
            
            pnD2DateGiven.text = pnDefaults.stringForKey("pnD2DateGiven")
            pnD2DoctorOffice.text = pnDefaults.stringForKey("pnD2DoctorOffice")
            pnD2DueDate.text = pnDefaults.stringForKey("pnD2DueDate")
            
            pnD3DateGiven.text = pnDefaults.stringForKey("pnD3DateGiven")
            pnD3DoctorOffice.text = pnDefaults.stringForKey("pnD3DoctorOffice")
            pnD3DueDate.text = pnDefaults.stringForKey("pnD3DueDate")
            
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
