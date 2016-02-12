//
//  ViewController.swift
//  ImmunizationRecord
//
//  Created by Anhad S Bhasin on 1/2/16.
//  Copyright © 2016 Anhad S Bhasin. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let defaults = NSUserDefaults.standardUserDefaults()
    
    
    @IBOutlet weak var textName: UITextField!
    
    @IBOutlet weak var textBirthdate: UITextField!
    
    @IBOutlet weak var textAllergies: UITextField!
    
    @IBOutlet weak var textVaccineReactions: UITextField!
    
    let imageSave = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //photoImageView.image = nil
        
        if imageSave.stringForKey("pngFileName") != nil
        {
            let path = NSSearchPathForDirectoriesInDomains(
                .DocumentDirectory, .UserDomainMask, true)[0] as NSString
            let fileName = NSUserDefaults.standardUserDefaults()
                .stringForKey("pngFileName")
            let imagePath = path.stringByAppendingPathComponent(fileName!)
            let image = UIImage(contentsOfFile: imagePath )
            
            photoImageView.image = image
            
        }
        
        if defaults.stringForKey("Name") != nil
        {
            textName.text = defaults.stringForKey("Name")!
            textBirthdate.text = defaults.stringForKey("Birthdate")!
            textAllergies.text = defaults.stringForKey("Allergies")!
            textVaccineReactions.text = defaults.stringForKey("VaccineReactions")!
            
        }
        

    }

  
    @IBAction func buttonSavePressed(sender: AnyObject)
    {
        
        defaults.setObject(textName.text, forKey:"Name")
        defaults.setObject(textBirthdate.text, forKey: "Birthdate")
        defaults.setObject(textAllergies.text, forKey: "Allergies")
        defaults.setObject(textVaccineReactions.text, forKey: "VaccineReactions")
    }
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBAction func selectPhoto() {
        
        let photoPicker = UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.sourceType = .PhotoLibrary
        self.presentViewController(photoPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        photoImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        let fileName:String = "logo.png"
        
        let arrayPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as NSString
        
        let pngFileName = arrayPaths.stringByAppendingPathComponent(fileName)
        
        UIImagePNGRepresentation(photoImageView.image!)!.writeToFile(pngFileName, atomically:true)
        
        imageSave.setObject(fileName, forKey: "pngFileName")
        
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    
    

}

