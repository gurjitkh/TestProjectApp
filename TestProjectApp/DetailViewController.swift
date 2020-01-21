//
//  DetailViewController.swift
//  TestProjectApp
//
//  Created by Gurjit on 2020-01-18.
//  Copyright © 2020 Gurjit. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController{
    
    //variables
    var contentText: String?
    var name:String?
    var identity: String?
    var group: String?
    var place_of_origin: String?
    var namepublisher: String?
    
 

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var secretIdLabel: UILabel!
    
    @IBOutlet weak var groupLabel: UILabel!
    
    @IBOutlet weak var originLabel: UILabel!
    
    @IBOutlet weak var companyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            self.nameLabel.text = name
            self.secretIdLabel.text = identity
            self.groupLabel.text = group
            self.originLabel.text = place_of_origin
        
        

        }

       
    

}
