//
//  Model.swift
//  TestProjectApp
//
//  Created by Gurjit on 2020-01-20.
//  Copyright © 2020 Gurjit. All rights reserved.
//

import UIKit

class Model {
    let name:String
       let identity: String
       let group: String
       let place_of_origin: String
       let namepublisher: String
       
       init(name: String, identity: String, group: String, place_of_origin: String, namepublisher: String) {
           self.name = name
           self.identity = identity
           self.group = group
           self.place_of_origin = place_of_origin
           self.namepublisher = namepublisher
           
       }

}
