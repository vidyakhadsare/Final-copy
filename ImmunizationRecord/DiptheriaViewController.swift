//
//  DiptheriaViewController.swift
//  ImmunizationRecord
//
//  Created by Anhad S Bhasin on 1/4/16.
//  Copyright © 2016 Anhad S Bhasin. All rights reserved.
//

import UIKit

class DiptheriaViewController: UITableViewController {
    let date = NSDate()
    let formatter = NSDateFormatter()
    let dipDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var dipD1GivenDate: UITextField!
    
    @IBOutlet weak var dipD1DoctorOffice: UITextField!
    
    
    @IBOutlet weak var dipD1DueDate: UITextField!
    
    
    @IBOutlet weak var dipD2GivenDAte: UITextField!
    
    
    @IBOutlet weak var dipD2DoctorOffice: UITextField!
    
    
    @IBOutlet weak var dipD2DueDate: UITextField!
    
    
    @IBOutlet weak var dipD3GivenDate: UITextField!
    
    
    @IBOutlet weak var dipD3DoctorOffice: UITextField!
    
    @IBOutlet weak var dipD3DueDate: UITextField!
    
    @IBOutlet weak var dipD4GivenDate: UITextField!
    
    
    @IBOutlet weak var dipD4DoctorOffice: UITextField!
    
    
    @IBOutlet weak var dipD4DueDate: UITextField!
    
    
    @IBOutlet weak var dipD5GivenDate: UITextField!
    
    @IBOutlet weak var dipD5DoctorOffice: UITextField!
    
    @IBOutlet weak var dipD5DueDate: UITextField!
    
    
    @IBOutlet weak var dipD6GivenDate: UITextField!
    
    @IBOutlet weak var dipD6DoctorOffice: UITextField!
    
    
    @IBOutlet weak var dipD6DueDate: UITextField!
    
    @IBAction func dipSave(sender: UIBarButtonItem)
    {
        dipDefaults.setObject(dipD1GivenDate.text, forKey: "dipD1GivenDate")
        dipDefaults.setObject(dipD1DoctorOffice.text, forKey: "dipD1DoctorOffice")
        dipDefaults.setObject(dipD1DueDate.text, forKey: "dipD1DueDate")
        
        dipDefaults.setObject(dipD2GivenDAte.text, forKey: "dipD2GivenDAte")
        dipDefaults.setObject(dipD2DoctorOffice.text, forKey: "dipD2DoctorOffice")
        dipDefaults.setObject(dipD2DueDate.text, forKey: "dipD2DueDate")
        
        dipDefaults.setObject(dipD3GivenDate.text, forKey: "dipD3GivenDate")
        dipDefaults.setObject(dipD3DoctorOffice.text, forKey: "dipD3DoctorOffice")
        dipDefaults.setObject(dipD3DueDate.text, forKey: "dipD3DueDate")
        
        dipDefaults.setObject(dipD4GivenDate.text, forKey: "dipD4GivenDate")
        dipDefaults.setObject(dipD4DoctorOffice.text, forKey: "dipD4DoctorOffice")
        dipDefaults.setObject(dipD4DueDate.text, forKey: "dipD4DueDate")
        
        dipDefaults.setObject(dipD5GivenDate.text, forKey: "dipD5GivenDate")
        dipDefaults.setObject(dipD5DoctorOffice.text, forKey: "dipD5DoctorOffice")
        dipDefaults.setObject(dipD5DueDate.text, forKey: "dipD5DueDate")
        
        dipDefaults.setObject(dipD6GivenDate.text, forKey: "dipD6GivenDate")
        dipDefaults.setObject(dipD6DoctorOffice.text, forKey: "dipD6DoctorOffice")
        dipDefaults.setObject(dipD6DueDate.text, forKey: "dipD6DueDate")
        
        //Send Notifications
        if dipDefaults.stringForKey("dipD1DueDate")! != ""
        {
            sendNotification(dipD1DueDate.text!  + " 10:00")
        }
        if (dipDefaults.stringForKey("dipD2DueDate")!) != ""
        {
            sendNotification(dipD2DueDate.text!  + " 10:00")
        }
        if dipDefaults.stringForKey("dipD3DueDate")! != ""
        {
            sendNotification(dipD3DueDate.text!  + " 10:00")
        }
        if dipDefaults.stringForKey("dipD4DueDate")! != ""
        {
            sendNotification(dipD4DueDate.text!  + " 10:00")
        }
        if (dipDefaults.stringForKey("dipD5DueDate")!) != ""
        {
            sendNotification(dipD5DueDate.text!  + " 10:00")
        }
        if dipDefaults.stringForKey("dipD6DueDate")! != ""
        {
            sendNotification(dipD6DueDate.text!  + " 10:00")
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
        notification.alertBody = "Your Diptheria vaccine is due in 2 days. Please call your Doctor. Thank You!"
        notification.fireDate = finalDate
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }
    
    @IBAction func dipD1GivenDateCurrentDAte()
    {
        
        formatter.dateStyle = .ShortStyle
        dipD1GivenDate.text = formatter.stringFromDate(date)
    }
    
    
    @IBAction func dipD2GivenDateCurrentDate()
    {
        
        formatter.dateStyle = .ShortStyle
        dipD2GivenDAte.text = formatter.stringFromDate(date)
    }
    
    
    @IBAction func dipD3GivenDateCurrentDate() {
        
        formatter.dateStyle = .ShortStyle
        dipD3GivenDate.text = formatter.stringFromDate(date)
    }
    
    @IBAction func dipD4GD() {
        
        formatter.dateStyle = .ShortStyle
        dipD4GivenDate.text = formatter.stringFromDate(date)
    }
    
    @IBAction func dipD5GD() {
        
        formatter.dateStyle = .ShortStyle
        dipD5GivenDate.text = formatter.stringFromDate(date)
    }
    
    @IBAction func dipD6GD() {
        
        formatter.dateStyle = .ShortStyle
        dipD6GivenDate.text = formatter.stringFromDate(date)
    }
    
    @IBAction func dipD2Same() {
        
        dipD2DoctorOffice.text = dipD1DoctorOffice.text
    }
    
    
    @IBAction func dipD3Same() {
        dipD3DoctorOffice.text = dipD2DoctorOffice.text
    }
    
    @IBAction func dipD4Same() {
        dipD4DoctorOffice.text = dipD3DoctorOffice.text
    }
    
    
    @IBAction func dipD5Same(sender: UIButton) {
        dipD5DoctorOffice.text = dipD4DoctorOffice.text
    }
    
    @IBAction func dipD6Same() {
        dipD6DoctorOffice.text = dipD5DoctorOffice.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if dipDefaults.stringForKey("dipD1GivenDate") != nil
        {
            dipD1GivenDate.text = dipDefaults.stringForKey("dipD1GivenDate")
            dipD1DoctorOffice.text = dipDefaults.stringForKey("dipD1DoctorOffice")
            dipD1DueDate.text = dipDefaults.stringForKey("dipD1DueDate")
            
            dipD2GivenDAte.text = dipDefaults.stringForKey("dipD2GivenDAte")
            dipD2DoctorOffice.text = dipDefaults.stringForKey("dipD2DoctorOffice")
            dipD2DueDate.text = dipDefaults.stringForKey("dipD2DueDate")
            
            dipD3GivenDate.text = dipDefaults.stringForKey("dipD3GivenDate")
            dipD3DoctorOffice.text = dipDefaults.stringForKey("dipD3DoctorOffice")
            dipD3DueDate.text = dipDefaults.stringForKey("dipD3DueDate")
            
            dipD4GivenDate.text = dipDefaults.stringForKey("dipD4GivenDate")
            dipD4DoctorOffice.text = dipDefaults.stringForKey("dipD4DoctorOffice")
            dipD4DueDate.text = dipDefaults.stringForKey("dipD4DueDate")
            
            dipD5GivenDate.text = dipDefaults.stringForKey("dipD5GivenDate")
            dipD5DoctorOffice.text = dipDefaults.stringForKey("dipD5DoctorOffice")
            dipD5DueDate.text = dipDefaults.stringForKey("dipD5DueDate")
            
            dipD6GivenDate.text = dipDefaults.stringForKey("dipD6GivenDate")
            dipD6DoctorOffice.text = dipDefaults.stringForKey("dipD6DoctorOffice")
            dipD6DueDate.text = dipDefaults.stringForKey("dipD6DueDate")
            
            
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
