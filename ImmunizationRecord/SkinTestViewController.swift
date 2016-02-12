//
//  SkinTestViewController.swift
//  VacWatch
//
//  Created by Vidya Khadsare on 1/26/16.
//  Copyright © 2016 Anhad S Bhasin. All rights reserved.
//

import UIKit

class SkinTestViewController: UITableViewController {
    
    let PPDDefaults = NSUserDefaults.standardUserDefaults()

    @IBOutlet weak var textPPDDose2DateGiven: UITextField!
    
    @IBOutlet weak var textPPDDoseGivenBy: UITextField!
    
    @IBOutlet weak var textPPDDoseDateRead: UITextField!
    
    @IBOutlet weak var textPPDDoseReadBy: UITextField!
    
    @IBOutlet weak var textMMIndur: UITextField!
    
    @IBOutlet weak var switchPPDInterpretation: UISwitch!
    
    @IBOutlet weak var textIGRA: UITextField!
    
    @IBOutlet weak var switchIGRAResult: UISwitch!
    
   
    @IBOutlet weak var textPPDDose2DateGiven2: UITextField!
 
    
    @IBOutlet weak var textPPDDoseGivenBy2: UITextField!
    
    
    @IBOutlet weak var textPPDDoseDateRead2: UITextField!
    
    
    @IBOutlet weak var textPPDDoseReadBy2: UITextField!
    
    @IBOutlet weak var textMMIndur2: UITextField!
    
    
    @IBOutlet weak var textIGRA2: UITextField!
    
    @IBOutlet weak var switchPPDInterpretation2: UISwitch!
    
    
    @IBOutlet weak var switchIGRAResult2: UISwitch!
    
    
    @IBOutlet weak var textPPDDose2DateGiven3: UITextField!
    
    @IBOutlet weak var textPPDDoseGivenBy3: UITextField!
    
    
    @IBOutlet weak var textPPDDoseDateRead3: UITextField!
    
    
    @IBOutlet weak var textPPDDoseReadBy3: UITextField!
    
    
    @IBOutlet weak var textMMIndur3: UITextField!
    
    
    @IBOutlet weak var textIGRA3: UITextField!
    
    
    @IBOutlet weak var switchPPDInterpretation3: UISwitch!
    
    
    @IBOutlet weak var switchIGRAResult3: UISwitch!
    
    
    @IBAction func buttonSave(sender: UIBarButtonItem) {
        
    //Dose1
        
    PPDDefaults.setObject(textPPDDose2DateGiven.text, forKey: "PPDDose2DateGiven1")
        
    PPDDefaults.setObject(textPPDDoseGivenBy.text, forKey: "PPDDoseGivenBy1")
        
    PPDDefaults.setObject(textPPDDoseDateRead.text, forKey: "PPDDoseDateRead1")
        
    PPDDefaults.setObject(textPPDDoseReadBy.text, forKey: "PPDDoseDateReadBy1")
        
    PPDDefaults.setObject(textMMIndur.text, forKey: "MMIndur1")
        
    PPDDefaults.setObject(textIGRA.text, forKey: "IGRA1")
        
    saveSwitchPosition(switchPPDInterpretation,keyName: "PPDInterpretation1")
        
    saveSwitchPosition(switchIGRAResult,keyName: "IGRAResult1")
        
        //Dose2
        
        PPDDefaults.setObject(textPPDDose2DateGiven2.text, forKey: "PPDDose2DateGiven2")
        
        PPDDefaults.setObject(textPPDDoseGivenBy2.text, forKey: "PPDDoseGivenBy2")
        
        PPDDefaults.setObject(textPPDDoseDateRead2.text, forKey: "PPDDoseDateRead2")
    
        PPDDefaults.setObject(textPPDDoseReadBy2.text, forKey: "PPDDoseDateReadBy2")
        
        PPDDefaults.setObject(textMMIndur2.text, forKey: "MMIndur2")
        
        PPDDefaults.setObject(textIGRA2.text, forKey: "IGRA2")
        
        saveSwitchPosition(switchPPDInterpretation2,keyName: "PPDInterpretation2")
        
        saveSwitchPosition(switchIGRAResult2,keyName: "IGRAResult2")
        
        //Dose3
        
        PPDDefaults.setObject(textPPDDose2DateGiven3.text, forKey: "PPDDose2DateGiven3")
        
        PPDDefaults.setObject(textPPDDoseGivenBy3.text, forKey: "PPDDoseGivenBy3")
        
        PPDDefaults.setObject(textPPDDoseDateRead3.text, forKey: "PPDDoseDateRead3")
        
        PPDDefaults.setObject(textPPDDoseReadBy3.text, forKey: "PPDDoseDateReadBy3")
        
        PPDDefaults.setObject(textMMIndur3.text, forKey: "MMIndur3")
        
        PPDDefaults.setObject(textIGRA3.text, forKey: "IGRA3")
        
        saveSwitchPosition(switchPPDInterpretation3,keyName: "PPDInterpretation3")
        
        saveSwitchPosition(switchIGRAResult3,keyName: "IGRAResult3")

        
    }
    
    func saveSwitchPosition(switchName:UISwitch, keyName:String)
    {
        if switchName.on {
            PPDDefaults.setBool(true, forKey: keyName)
        } else {
            PPDDefaults.setBool(false, forKey: keyName)
        }
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if PPDDefaults.stringForKey("PPDDose2DateGiven1") != nil
        {
            
            //Dose1
            textPPDDose2DateGiven.text = PPDDefaults.stringForKey("PPDDose2DateGiven1")!
            
            textPPDDoseGivenBy.text = PPDDefaults.stringForKey("PPDDoseGivenBy1")!
    
            textPPDDoseDateRead.text = PPDDefaults.stringForKey("PPDDoseDateRead1")!
            
            textPPDDoseReadBy.text = PPDDefaults.stringForKey("PPDDoseDateReadBy1")!
            
            textMMIndur.text = PPDDefaults.stringForKey("MMIndur1")!
            
            textIGRA.text = PPDDefaults.stringForKey("IGRA1")!
            
            switchPPDInterpretation.on = PPDDefaults.boolForKey("PPDInterpretation1")
            
            switchIGRAResult.on = PPDDefaults.boolForKey("IGRAResult1")
        }
        
        if PPDDefaults.stringForKey("PPDDose2DateGiven2") != nil
        {

            //Dose2
            textPPDDose2DateGiven2.text = PPDDefaults.stringForKey("PPDDose2DateGiven2")!
            
            textPPDDoseGivenBy2.text = PPDDefaults.stringForKey("PPDDoseGivenBy2")!
            
            textPPDDoseDateRead2.text = PPDDefaults.stringForKey("PPDDoseDateRead2")!
            
            textPPDDoseReadBy2.text = PPDDefaults.stringForKey("PPDDoseDateReadBy2")!
            
            
            textMMIndur2.text = PPDDefaults.stringForKey("MMIndur2")!
            
            textIGRA2.text = PPDDefaults.stringForKey("IGRA2")!
            
            switchPPDInterpretation2.on = PPDDefaults.boolForKey("PPDInterpretation2")
            
            switchIGRAResult2.on = PPDDefaults.boolForKey("IGRAResult2")
        }
        
        
        if PPDDefaults.stringForKey("PPDDose2DateGiven3") != nil
        {
            
            //Dose3
            textPPDDose2DateGiven3.text = PPDDefaults.stringForKey("PPDDose2DateGiven3")!
            
            textPPDDoseGivenBy3.text = PPDDefaults.stringForKey("PPDDoseGivenBy3")!
            
            textPPDDoseDateRead3.text = PPDDefaults.stringForKey("PPDDoseDateRead3")!
            
            textPPDDoseReadBy3.text = PPDDefaults.stringForKey("PPDDoseDateReadBy3")!
            
            
            textMMIndur3.text = PPDDefaults.stringForKey("MMIndur3")!
            
            textIGRA3.text = PPDDefaults.stringForKey("IGRA3")!
            
            switchPPDInterpretation3.on = PPDDefaults.boolForKey("PPDInterpretation3")
            
            switchIGRAResult3.on = PPDDefaults.boolForKey("IGRAResult3")

            
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

   /* override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
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
