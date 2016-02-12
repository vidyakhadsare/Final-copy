//
//  PolioViewController.swift
//  ImmunizationRecord
//
//  Created by Anhad S Bhasin on 1/5/16.
//  Copyright © 2016 Anhad S Bhasin. All rights reserved.
//

import UIKit

class PolioViewController: UITableViewController {
    let date = NSDate()
    let formatter = NSDateFormatter()
    let poDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var poDateGiven: UITextField!
    
    @IBOutlet weak var poDoctorOffice: UITextField!
    
    
    @IBOutlet weak var poDueDate: UITextField!
    
    @IBOutlet weak var poD2DateGiven: UITextField!
    
    @IBOutlet weak var poD2DoctorOffice: UITextField!
    
    @IBOutlet weak var poD2DueDate: UITextField!
    
    @IBOutlet weak var poD3DateGiven: UITextField!
    
    @IBOutlet weak var poD3DoctorOffice: UITextField!
    
    @IBOutlet weak var poD3DueDate: UITextField!
    
    
    @IBAction func poSave(sender: UIBarButtonItem) {
        
        poDefaults.setObject(poDateGiven.text, forKey: "poDateGiven")
        poDefaults.setObject(poDoctorOffice.text, forKey: "poDoctorOffice")
        poDefaults.setObject(poDueDate.text, forKey: "poDueDate")
    
        poDefaults.setObject(poD2DateGiven.text, forKey: "poD2DateGiven")
        poDefaults.setObject(poD2DoctorOffice.text, forKey: "poD2DoctorOffice")
        poDefaults.setObject(poD2DueDate.text, forKey: "poD2DueDate")
    
        poDefaults.setObject(poD3DateGiven.text, forKey: "poD3DateGiven")
        poDefaults.setObject(poD3DoctorOffice.text, forKey: "poD3DoctorOffice")
        poDefaults.setObject(poD3DueDate.text, forKey: "poD3DueDate")
        
        //Send Notifications
        if poDefaults.stringForKey("poDueDate")! != ""
        {
            sendNotification(poDueDate.text!  + " 10:00")
        }
        if (poDefaults.stringForKey("pnD2DueDate")!) != ""
        {
            sendNotification(poD2DueDate.text!  + " 10:00")
        }
        if poDefaults.stringForKey("poD3DueDate")! != ""
        {
            sendNotification(poD3DueDate.text!  + " 10:00")
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
        notification.alertBody = "Your Polio vaccine is due in 2 days. Please call your Doctor. Thank You!"
        notification.fireDate = finalDate
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }
    
    
    @IBAction func poD2Same() {
        poD2DoctorOffice.text = poDoctorOffice.text
    }
    
    @IBAction func poD3Same() {
        poD3DoctorOffice.text = poD2DoctorOffice.text
    }
    
    @IBAction func poD1GDCD() {
        formatter.dateStyle = .ShortStyle
        poDateGiven.text = formatter.stringFromDate(date)
        
    }
    
    @IBAction func poD2GDCD() {
        formatter.dateStyle = .ShortStyle
        poD2DateGiven.text = formatter.stringFromDate(date)
    }
    
    @IBAction func poD3GDCD() {
        formatter.dateStyle = .ShortStyle
        poD3DateGiven.text = formatter.stringFromDate(date)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if poDefaults.stringForKey("poDateGiven") != nil
        {
            poDateGiven.text = poDefaults.stringForKey("poDateGiven")
            poDoctorOffice.text = poDefaults.stringForKey("poDoctorOffice")
            poDueDate.text = poDefaults.stringForKey("poDueDate")
            
            poD2DateGiven.text = poDefaults.stringForKey("poD2DateGiven")
            poD2DoctorOffice.text = poDefaults.stringForKey("poD2DoctorOffice")
            poD2DueDate.text = poDefaults.stringForKey("poD2DueDate")
            
            poD3DateGiven.text = poDefaults.stringForKey("poD3DateGiven")
            poD3DoctorOffice.text = poDefaults.stringForKey("poD3DoctorOffice")
            poD3DueDate.text = poDefaults.stringForKey("poD3DueDate")
            
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
