//
//  menViewController.swift
//  ImmunizationRecord
//
//  Created by Anhad S Bhasin on 1/5/16.
//  Copyright © 2016 Anhad S Bhasin. All rights reserved.
//

import UIKit

class menViewController: UITableViewController {
    let date = NSDate()
    let formatter = NSDateFormatter()
    let menDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var menD1DateGiven: UITextField!
    
    @IBOutlet weak var menD1DoctorOffice: UITextField!
    
    @IBOutlet weak var menD1DueDate: UITextField!
    
    
    
    @IBOutlet weak var menD2DateGiven: UITextField!
    
    @IBOutlet weak var menD2DoctorOffice: UITextField!
    
    @IBOutlet weak var menD2DueDate: UITextField!
    
    
    
    
    @IBOutlet weak var menD3DateGiven: UITextField!
    
    @IBOutlet weak var menD3DoctorOffice: UITextField!
    
    @IBOutlet weak var menD3DueDate: UITextField!
    
    
    @IBAction func menSave(sender: UIBarButtonItem) {
        
        menDefaults.setObject(menD1DateGiven.text, forKey: "menD1DateGiven")
        menDefaults.setObject(menD1DoctorOffice.text, forKey: "menD1DoctorOffice")
        menDefaults.setObject(menD1DueDate.text, forKey: "menD1DueDate")
    
        menDefaults.setObject(menD2DateGiven.text, forKey: "menD2DateGiven")
        menDefaults.setObject(menD2DoctorOffice.text, forKey: "menD2DoctorOffice")
        menDefaults.setObject(menD2DueDate.text, forKey: "menD2DueDate")
    
        menDefaults.setObject(menD3DateGiven.text, forKey: "menD3DateGiven")
        menDefaults.setObject(menD3DoctorOffice.text, forKey: "menD3DoctorOffice")
        menDefaults.setObject(menD3DueDate.text, forKey: "menD3DueDate")
        
        //Send Notifications
        if menDefaults.stringForKey("menD1DueDate")! != ""
        {
            sendNotification(menD1DueDate.text!  + " 10:00")
        }
        if (menDefaults.stringForKey("menD2DueDate")!) != ""
        {
            sendNotification(menD2DueDate.text!  + " 10:00")
        }
        if menDefaults.stringForKey("menD3DueDate")! != ""
        {
            sendNotification(menD3DueDate.text!  + " 10:00")
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
        notification.alertBody = "Your Meningococcal vaccine is due in 2 days. Please call your Doctor. Thank You!"
        notification.fireDate = finalDate
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }
    
    @IBAction func menD1DGCD() {
        
        formatter.dateStyle = .ShortStyle
        menD1DateGiven.text = formatter.stringFromDate(date)
        
    }
    
    @IBAction func menD2DGCD() {
        formatter.dateStyle = .ShortStyle
        menD2DateGiven.text = formatter.stringFromDate(date)
    }
    
    @IBAction func menD3DGCD() {
        formatter.dateStyle = .ShortStyle
        menD3DateGiven.text = formatter.stringFromDate(date)
    }
    
    
    @IBAction func menD2Same() {
        menD2DoctorOffice.text = menD1DoctorOffice.text
    }
    
    @IBAction func menD3Same() {
        menD3DoctorOffice.text = menD2DoctorOffice.text
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if menDefaults.stringForKey("menD1DateGiven") != nil
        {
            menD1DateGiven.text = menDefaults.stringForKey("menD1DateGiven")
            menD1DoctorOffice.text = menDefaults.stringForKey("menD1DoctorOffice")
            menD1DueDate.text = menDefaults.stringForKey("menD1DueDate")
        
            menD2DateGiven.text = menDefaults.stringForKey("menD2DateGiven")
            menD2DoctorOffice.text = menDefaults.stringForKey("menD2DoctorOffice")
            menD2DueDate.text = menDefaults.stringForKey("menD2DueDate")
        
            menD3DateGiven.text = menDefaults.stringForKey("menD3DateGiven")
            menD3DoctorOffice.text = menDefaults.stringForKey("menD3DoctorOffice")
            menD3DueDate.text = menDefaults.stringForKey("menD3DueDate")
            
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
