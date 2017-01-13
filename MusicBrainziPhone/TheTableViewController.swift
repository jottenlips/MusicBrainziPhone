//
//  TheTableViewController.swift
//  MusicBrainziPhone
//
//  Created by John Ottenlips on 12/16/16.
//  Copyright © 2016 jottenlips. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import PromiseKit

class TheTableViewController: UITableViewController {

    @IBOutlet weak var theLabel: UILabel!
    var data:JSON!
    var searchType:String!
    var searchTerm:String!
    var rowSelected:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.theLabel.text = searchType + " " + searchTerm
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("You selected cell #\(indexPath.row)!")
        self.rowSelected = (indexPath.row)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
    
        
        var theCount = 0
        if(self.searchType == "artist"){
            if let artist = data{
                theCount = artist["artists"].count
            }
        }
        else if (self.searchType=="label"){
            if let labels = data{
                theCount = labels["labels"].count
            }
        }
        else{
            if let releases = data{
                theCount = releases["release-groups"].count
            }
        }

        return theCount
    }

     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
//        if let artist = self.data{
//            cell.textLabel?.text = String(describing: artist)
//        }
        if(self.searchType == "artist"){
        if let artist = data{
            cell.textLabel?.text = String(describing: artist["artists"][indexPath.row]["name"])
            cell.detailTextLabel?.text = String(describing: artist["artists"][indexPath.row]["type"])+" "+String( describing: artist["artists"][indexPath.row]["life-span"]["begin"])

            }
        }
        else if (self.searchType=="label"){
            if let labels = data{
            cell.textLabel?.text = String(describing: labels["labels"][indexPath.row]["name"])
            }
        }
        else{
            if let releases = data{
                cell.textLabel?.text = String(describing: releases["release-groups"][indexPath.row]["releases"][0]["title"])
            }
        }
        
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section: \(indexPath.section)")
        print("row: \(indexPath.row)")
        self.rowSelected = indexPath.row
        performSegue(withIdentifier: "DetailSegue", sender: Any?.self)
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let destinationViewController = segue.destination as? DetailedViewController {
            destinationViewController.indexNumber = self.rowSelected
            destinationViewController.data = self.data
        }
    }
 

}
