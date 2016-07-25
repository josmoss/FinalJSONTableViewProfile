//
//  ViewController.swift
//  FinalProjectJSONTableViewProfileView
//
//  Created by Joe Moss on 7/23/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    typealias JSONDictionary = [String:AnyObject]
    typealias JSONArray = [JSONDictionary]
    
    var destinationArray = [Destination]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let filePath = NSBundle.mainBundle().URLForResource("destinations", withExtension: "json") {
            
            if let data = NSData(contentsOfURL: filePath)
            {
                
                do
                {
                    
                    if let jsonDict = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? JSONDictionary
                    {
                        
                        if let destinationsArray = jsonDict["destinations"] as? JSONArray
                        {
                            
                            for destinationsDict in destinationsArray {
                                
                                let theDestination = Destination()
                                
                                if let name = destinationsDict["name"] as? String {
                                    
                                    theDestination.name = name
                                } else {
                                    print("I couldn't parse the name.")
                                }
                                
                                if let description = destinationsDict["description"] as? String {
                                    
                                    theDestination.destDescription = description
                                } else {
                                    print("I couldn't parse the description.")
                                }
                                
                                if let imagesArray = destinationsDict["images"] as? JSONArray
                                {
                                    
                                    for imageDict in imagesArray {
                                        
                                        if let imageString = imageDict["imageName"] as? String {
                                            
                                            theDestination.imagesArray.append(imageString)
                                            
                                        }
                                        
                                    }
                                    
                                }
                                
                                if let contactInfo = destinationsDict["contactInformation"] as? String {
                                    
                                    theDestination.contactInfo = contactInfo
                                } else {
                                    print("I couldn't parse the contact info.")
                                }
                                
                                if let specialInfo = destinationsDict["specialInformation"] as? String {
                                    
                                    theDestination.specInfo = specialInfo
                                } else {
                                    print("I couldn't parse the special info.")
                                }
                                
                                if let category = destinationsDict["category"] as? String {
                                    
                                    theDestination.category = category
                                } else {
                                    print("I couldn't parse the category.")
                                }
                                
                                if let latitude = destinationsDict["latitude"] as? Double {
                                    
                                    theDestination.latitude = latitude
                                } else {
                                    print("I couldn't parse the latitude.")
                                }
                                
                                if let longitude = destinationsDict["longitude"] as? Double {
                                    
                                    theDestination.longitude = longitude
                                } else {
                                    print("I couldn't parse the longitude.")
                                }
                                
                                if let charge = destinationsDict["charge"] as? Double {
                                    
                                    theDestination.charge = charge
                                } else {
                                    print("I couldn't parse the charge.")
                                }
                                
                                self.destinationArray.append(theDestination)
                            }
                        }
                    }
                } catch {
                    print("I can't parse the json data")
                }
                
            }
            
        }
        
        print(destinationArray.count)
        
        for theDestination in destinationArray
        {
            
            print(theDestination.name)
            print(theDestination.destDescription)
            print(theDestination.contactInfo)
            print(theDestination.specInfo)
            print(theDestination.category)
            print(theDestination.latitude)
            print(theDestination.longitude)
            print(theDestination.charge)
            
            for imageString in theDestination.imagesArray
            {
                
                print(imageString)
                
            }
            
        }
        
    }
    
}