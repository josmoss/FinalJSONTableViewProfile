//
//  CardStackViewController.swift
//  FinalJSONTableView&Profile
//
//  Created by Joe Moss on 7/28/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit

class CardStackViewController: UIViewController, CardStackDelegate {

    @IBOutlet weak var cardStackView: CardStack!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cardStackView.delegate = self
        
    }
    
    func cardInterested(dest: Destination) {
        print("interested in \(dest.name)")
        
        DataStore.sharedInstance.addFavoriteDestination(dest)
        
    }
    
    func cardNotInterested(dest: Destination) {
        print("not interested in \(dest.name)")
    }

}
