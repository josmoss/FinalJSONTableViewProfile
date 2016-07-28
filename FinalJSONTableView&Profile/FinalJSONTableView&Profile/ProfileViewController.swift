//
//  ProfileViewController.swift
//  FinalJSONTableView&Profile
//
//  Created by Joe Moss on 7/28/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var destDescriptionLabel: UILabel!
    @IBOutlet weak var contactInfoLabel: UILabel!
    @IBOutlet weak var chargeLabel: UILabel!
    @IBOutlet weak var specInfoLabel: UILabel!

    var theDestination : Destination?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let destination = self.theDestination {
            
            self.nameLabel.text = destination.name
            self.destDescriptionLabel.text = destination.destDescription
            self.contactInfoLabel.text = destination.contactInfo
            self.chargeLabel.text = destination.charge
            self.specInfoLabel.text = destination.specInfo
        }
    }

}
