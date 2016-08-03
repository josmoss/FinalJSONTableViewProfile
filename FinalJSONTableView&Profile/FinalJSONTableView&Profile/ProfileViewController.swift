//
//  ProfileViewController.swift
//  FinalJSONTableView&Profile
//
//  Created by Joe Moss on 7/28/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var destDescription: UITextView!
    @IBOutlet weak var contactInfoLabel: UILabel!
    @IBOutlet weak var chargeLabel: UILabel!
    @IBOutlet weak var specInfoLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    var theDestination : Destination?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let destination = self.theDestination {
            
            self.nameLabel.text = destination.name
            self.destDescription.text = destination.destDescription
            self.contactInfoLabel.text = destination.contactInfo
            self.chargeLabel.text = destination.charge
            self.specInfoLabel.text = destination.specInfo
        
            for imgString in destination.imagesArray {
              // print(imgString)
        
            }
            
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let images = theDestination?.imagesArray
 
        return images!.count

    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
        
        let images = theDestination?.imagesArray
        
        let image = images![indexPath.row]
        
        cell.imageView.image = UIImage(named: image.imageName)
 
        return cell
    }
    
    @IBAction func buttonTapped(sender: UIButton) {
        
        performSegueWithIdentifier("showMap", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showMap" {
            
            if let controller = segue.destinationViewController as? MapViewController {
                
                controller.theMap = self.theDestination
                
            } else {
                print("Not the correct segue")
            }
            
        }
        
    }

}
