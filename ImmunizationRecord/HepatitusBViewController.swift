//
//  HepatitusBViewController.swift
//  ImmunizationRecord
//
//  Created by Anhad S Bhasin on 1/3/16.
//  Copyright © 2016 Anhad S Bhasin. All rights reserved.
//

import UIKit

class HepatitusBViewController: UITableViewController {
    let date = NSDate()
    let formatter = NSDateFormatter()
    let hepatitusBDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var textDose1DateGiven: UITextField!
    
    @IBOutlet weak var textDose1DoctorOffice: UITextField!

    @IBOutlet weak var textDose1DueDate: UITextField!
    
    @IBOutlet weak var textDose2DateGiven: UITextField!
    
    @IBOutlet weak var textDose2DoctorOffice: UITextField!
    
    @IBOutlet weak var textDose2DueDate: UITextField!
    
    @IBOutlet weak var textDose3DateGiven: UITextField!
    
    @IBOutlet weak var textDose3DoctorOffice: UITextField!
    
   
    @IBOutlet weak var textDose3DueDate: UITextField!
    
    @IBAction func buttonHepatitusSave(sender: AnyObject) {
        
        hepatitusBDefaults.setObject(textDose1DateGiven.text, forKey: "Dose1DateGiven")
        hepatitusBDefaults.setObject(textDose1DoctorOffice.text, forKey: "Dose1DoctorOffice")
        hepatitusBDefaults.setObject(textDose1DueDate.text, forKey: "Dose1DueDate")
        hepatitusBDefaults.setObject(textDose2DateGiven.text, forKey: "Dose2DateGiven")
        hepatitusBDefaults.setObject(textDose2DoctorOffice.text, forKey: "Dose2DoctorOffice")
        hepatitusBDefaults.setObject(textDose2DueDate.text, forKey: "Dose2DueDate")
        hepatitusBDefaults.setObject(textDose3DateGiven.text, forKey: "Dose3DateGiven")
        hepatitusBDefaults.setObject(textDose3DoctorOffice.text, forKey: "Dose3DoctorOffice")
        hepatitusBDefaults.setObject(textDose3DueDate.text, forKey: "Dose3DueDate")
        
        //Send Notifications
        if hepatitusBDefaults.stringForKey("Dose1DueDate")! != ""
        {
        sendNotification(textDose1DueDate.text!  + " 10:00")
        }
        if (hepatitusBDefaults.stringForKey("Dose2DueDate")!) != ""
        {
        sendNotification(textDose2DueDate.text!  + " 10:00")
        }
        if hepatitusBDefaults.stringForKey("Dose3DueDate")! != ""
        {
        sendNotification(textDose3DueDate.text!  + " 10:00")
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
        notification.alertBody = "Your Hepatitis B vaccine is due in 2 days. Please call your Doctor. Thank You!"
        notification.fireDate = finalDate
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
     
    }
    
    
    @IBAction func buttonDose2SameAsAbove()
    {
        textDose2DoctorOffice.text = textDose1DoctorOffice.text
    }
    
    @IBAction func buttonDose3SameAsAbove()
    {
        textDose3DoctorOffice.text = textDose2DoctorOffice.text
    }
    
    @IBAction func textDateGivenPressed()
    {
        
        formatter.dateStyle = .ShortStyle
        textDose1DateGiven.text = formatter.stringFromDate(date)
    }
    
    
    @IBAction func textDose2DateGivenPressed()
    {
        
        formatter.dateStyle = .ShortStyle
        textDose2DateGiven.text = formatter.stringFromDate(date)
    }
    
    
    @IBAction func textDose3DateGivenPressed()
    {
        formatter.dateStyle = .ShortStyle
        textDose3DateGiven.text = formatter.stringFromDate(date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    if hepatitusBDefaults.stringForKey("Dose1DateGiven") != nil
        {
            textDose1DateGiven.text = hepatitusBDefaults.stringForKey("Dose1DateGiven")!
            //textDose1DoctorOffice.text = hepatitusBDefaults.stringForKey("Dose1DoctorOffice")
            textDose1DueDate.text = hepatitusBDefaults.stringForKey("Dose1DueDate")
            textDose2DateGiven.text = hepatitusBDefaults.stringForKey("Dose2DateGiven")
            textDose2DoctorOffice.text = hepatitusBDefaults.stringForKey("Dose2DoctorOffice")
            textDose2DueDate.text = hepatitusBDefaults.stringForKey("Dose2DueDate")
            textDose3DateGiven.text = hepatitusBDefaults.stringForKey("Dose3DateGiven")
            textDose3DoctorOffice.text = hepatitusBDefaults.stringForKey("Dose3DoctorOffice")
            textDose3DueDate.text = hepatitusBDefaults.stringForKey("Dose3DueDate")
            
        }
       
        
        
        
        //print("formatter = \(formatter)")

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
    */
    /*
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
