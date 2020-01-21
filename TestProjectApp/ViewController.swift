//
//  ViewController.swift
//  TestProjectApp
//
//  Created by Gurjit on 2020-01-18.
//  Copyright © 2020 Gurjit. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    final let urlString = "http://ios-prod.aivia.dev/api/production/heros"
    
     var superHeroArray = [Model]()
   
    
   // var jsonDictionary = [String: Any]()
    
    
    //IBoutlet of UITableView
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var textLabel: UILabel!
    
    //Array
    //let superHeros = ["Super Girl", "Thor", "Tick"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        //downloading json data from api
    
        downloadJsonWithURL()
        
        tableView.dataSource = self
        tableView.delegate = self

    }
    
    func downloadJsonWithURL() {
        let url = NSURL(string: urlString)
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                // print(jsonObj.value(forKey: "data") as Any)
                
                if let jArray = jsonObj.value(forKey: "data") as? NSArray{
                    for arr in jArray{
                       // print(arr)
                        let hDicnionary = arr as? NSDictionary
                        //print(hDicnionary?.value(forKey: "name") as Any)
                        
                    }
                }
                
                if let heroArray = jsonObj.value(forKey: "data") as? NSArray {
                    for hero in heroArray{
                        if let actorDict = hero as? NSDictionary {
                            
                            let nameStr: String = {
                                if let name = actorDict.value(forKey: "name") {
                                    //print(name)
                                    return name as! String
                                }
                                return "name"
                            }()
                            
                            let identityStr: String = {
                                
                                if let identity = actorDict.value(forKey: "identity") {
                                    return identity as! String
                                }
                                return "identity"
                            }()
                            
                            let groupStr: String = {
                               
                                if let group = actorDict.value(forKey: "group") {
                                    return group as! String
                                }
                                return "group"
                            }()
                            let place_of_originStr: String = {
                                                      
                                if let place_of_origin = actorDict.value(forKey: "place_of_origin") {
                                    return place_of_origin as! String
                                }
                                return "place_of_origin"
                            }()
                            let namepublisherStr: String = {
                                                                                 
                                if let namepublisher = actorDict.value(forKey: "namepublisher") {
                                    return namepublisher as! String
                                }
                                    return "namepublisher"
                            }()
                            
                            self.superHeroArray.append(Model(name: nameStr, identity: identityStr, group: groupStr, place_of_origin: place_of_originStr, namepublisher: namepublisherStr))
                            
                            OperationQueue.main.addOperation({
                                self.tableView.reloadData()
                            })
                        }
                    }
                }
            }
        }).resume()
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailView"{
            let detailVC: DetailViewController? = segue.destination as?
            DetailViewController
            let cell: UITableViewCell? = sender as? UITableViewCell
            if cell != nil && detailVC != nil {
                //
                detailVC?.name = cell!.textLabel!.text
                
            }
        }
    }
    
    // MARK: - TABLEVIEW DELEGATE AND DATA SOURCE
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superHeroArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "objName", for: indexPath)
        
        let hero = superHeroArray[indexPath.row]
        
        cell.textLabel?.text = hero.name
        
        return cell
    }
   
}
