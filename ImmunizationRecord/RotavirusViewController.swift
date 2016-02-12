//
//  RotavirusViewController.swift
//  ImmunizationRecord
//
//  Created by Anhad S Bhasin on 1/4/16.
//  Copyright © 2016 Anhad S Bhasin. All rights reserved.
//

import UIKit

class RotavirusViewController: UITableViewController {
    let date = NSDate()
    let formatter = NSDateFormatter()
    let rotaDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var textRotaDose1DateGiven: UITextField!
    
    @IBOutlet weak var textRotaDose1DoctorOffice: UITextField!
   
    @IBOutlet weak var textRotaDose1DueDate: UITextField!
   
    
    @IBOutlet weak var textRotaDose2DateGiven: UITextField!
    
    @IBOutlet weak var textRotaDose2DoctorOffice: UITextField!
    
    
    @IBOutlet weak var textRotaDose2DueDate: UITextField!
    
    @IBOutlet weak var textRotaDose3DateGiven: UITextField!
    
    @IBOutlet weak var textRotaDose3DoctorOffice: UITextField!
    
    
    @IBOutlet weak var textRotaDose3DueDate: UITextField!
    
    @IBAction func buttonRotaSavePressed(sender: UIBarButtonItem) {
        
        rotaDefaults.setObject(textRotaDose1DateGiven.text, forKey: "RotaDose1DateGiven")
        rotaDefaults.setObject(textRotaDose1DoctorOffice.text, forKey: "RotaDose1DoctorOffice")
        rotaDefaults.setObject(textRotaDose1DueDate.text, forKey: "RotaDose1DueDate")
        rotaDefaults.setObject(textRotaDose2DateGiven.text, forKey: "RotaDose2DateGiven")
        rotaDefaults.setObject(textRotaDose2DoctorOffice.text, forKey: "RotaDose2DoctorOffice")
        rotaDefaults.setObject(textRotaDose2DueDate.text, forKey: "RotaDose2DueDate")
        rotaDefaults.setObject(textRotaDose3DateGiven.text, forKey: "RotaDose3DateGiven")
        rotaDefaults.setObject(textRotaDose3DoctorOffice.text, forKey: "RotaDose3DoctorOffice")
        rotaDefaults.setObject(textRotaDose3DueDate.text, forKey: "textRotaDose3DueDate")
    
        //Send Notifications
        if rotaDefaults.stringForKey("RotaDose1DueDate")! != ""
        {
            sendNotification(textRotaDose1DueDate.text!  + " 10:00")
        }
        if (rotaDefaults.stringForKey("RotaDose2DueDate")!) != ""
        {
            sendNotification(textRotaDose2DueDate.text!  + " 10:00")
        }
        if rotaDefaults.stringForKey("textRotaDose3DueDate")! != ""
        {
            sendNotification(textRotaDose3DueDate.text!  + " 10:00")
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
        notification.alertBody = "Your Rotavirus vaccine is due in 2 days. Please call your Doctor. Thank You!"
        notification.fireDate = finalDate
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }
    
    @IBAction func buttonRotaDose1SameAsAbove()
    {
        textRotaDose2DoctorOffice.text = textRotaDose1DoctorOffice.text
    }
    
    @IBAction func buttonRotaDose3SameAsAbove()
    {
        textRotaDose3DoctorOffice.text = textRotaDose2DoctorOffice.text
    }
    
    
    @IBAction func rotaDateGivenCurrentDate()
    {
        formatter.dateStyle = .ShortStyle
        textRotaDose1DateGiven.text = formatter.stringFromDate(date)
    }
    
    
    
    @IBAction func rotaDose2DateGivenCurrentDate()
    {
        formatter.dateStyle = .ShortStyle
        textRotaDose2DateGiven.text = formatter.stringFromDate(date)
        
    }
    
    
    @IBAction func rotaDose3DateGivenCurrentDate()
    {
        formatter.dateStyle = .ShortStyle
        textRotaDose3DateGiven.text = formatter.stringFromDate(date)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if rotaDefaults.stringForKey("RotaDose1DateGiven") != nil
        {
            textRotaDose1DateGiven.text = rotaDefaults.stringForKey("RotaDose1DateGiven")!
            textRotaDose1DoctorOffice.text = rotaDefaults.stringForKey("RotaDose1DoctorOffice")!
            textRotaDose1DueDate.text = rotaDefaults.stringForKey("RotaDose1DueDate")!
            textRotaDose2DateGiven.text = rotaDefaults.stringForKey("RotaDose2DateGiven")!
            textRotaDose2DoctorOffice.text = rotaDefaults.stringForKey("RotaDose2DoctorOffice")!
            textRotaDose2DueDate.text = rotaDefaults.stringForKey("RotaDose2DueDate")!
            textRotaDose3DateGiven.text = rotaDefaults.stringForKey("RotaDose3DateGiven")!
            textRotaDose3DoctorOffice.text = rotaDefaults.stringForKey("RotaDose3DoctorOffice")!
            textRotaDose3DueDate.text = rotaDefaults.stringForKey("textRotaDose3DueDate")!
            
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
