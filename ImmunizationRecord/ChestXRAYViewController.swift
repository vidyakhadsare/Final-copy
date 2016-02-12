//
//  ChestXRAYViewController.swift
//  VacWatch
//
//  Created by Vidya Khadsare on 1/27/16.
//  Copyright © 2016 Anhad S Bhasin. All rights reserved.
//

import UIKit

class ChestXRAYViewController: UITableViewController {
    
     let XRAYDefaults = NSUserDefaults.standardUserDefaults()


    @IBOutlet weak var FilmDate: UITextField!
    
    
    @IBOutlet weak var switchInterpretation: UISwitch!
    
    
    @IBOutlet weak var switchYesNo: UISwitch!
    
    @IBAction func saveButton(sender: UIBarButtonItem) {
        
        
        XRAYDefaults.setObject(FilmDate.text, forKey: "FilmDate")
        
        saveSwitchPosition(switchInterpretation,keyName: "switchInterpretation")
        
        saveSwitchPosition(switchYesNo,keyName: "switchYesNo")
    }
    
    
    func saveSwitchPosition(switchName:UISwitch, keyName:String)
    {
        if switchName.on {
            XRAYDefaults.setBool(true, forKey: keyName)
        } else {
            XRAYDefaults.setBool(false, forKey: keyName)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if XRAYDefaults.stringForKey("FilmDate") != nil
        {
            
            //Dose1
            FilmDate.text = XRAYDefaults.stringForKey("FilmDate")!
            
        
            switchInterpretation.on = XRAYDefaults.boolForKey("switchInterpretation")
            
            switchYesNo.on = XRAYDefaults.boolForKey("switchYesNo")
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

   /* override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

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
*/
}
