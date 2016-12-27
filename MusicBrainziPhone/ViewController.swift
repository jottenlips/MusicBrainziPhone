//
//  ViewController.swift
//  MusicBrainziPhone
//
//  Created by John Ottenlips on 12/14/16.
//  Copyright © 2016 jottenlips. All rights reserved.
//




import UIKit
import Alamofire
import SwiftyJSON
import PromiseKit



class ViewController: UIViewController {
    //globals
    let BASE_URL = "http://musicbrainz.org/ws/2/"
    let format_query = "?fmt=json&query="
    var theData:JSON!
    var searchType:String!
    
    @IBOutlet weak var artistProducerSwitch: UISwitch!
    @IBOutlet weak var searchField: UITextField!

    @IBOutlet weak var artistSwitch: UISwitch!
    @IBOutlet weak var albumSwitch: UISwitch!
    @IBOutlet weak var labelSwitch: UISwitch!
    
    
    
    @IBAction func pressedSearchButton(_ sender: AnyObject) {
        var searchType = "artist"
        if (artistSwitch.isOn){
            searchType = "artist"
            self.searchType = "artist"
            // call getdata, store JSON in a list variable
        }
        if (albumSwitch.isOn){
            searchType = "release-group"
            self.searchType = "release-group"
            // call getdata, store JSON in a list variable
        }
        if (labelSwitch.isOn){
            searchType = "label"
            self.searchType = "label"
            // call getdata, store JSON in a list variable
        }
        print("button pressed")
        if let theSearchTerm = self.searchField.text{
            getTheJSON(searchTerm:theSearchTerm, searchType: searchType)

            
        }
        
       
    }
    
    
    func getTheJSON(searchTerm: String, searchType: String)
    {
        //self.thedata = Auth().getJSON(searchTerm: theSearchTerm, searchType: searchType).value
        
        Auth().getJSON(searchTerm: searchTerm, searchType: searchType)
            .then
            {
                (data) -> Void in
                self.theData = data
                print(self.theData)
                self.performSegue(withIdentifier: "FirstSegue", sender: UIDevice.self)
                
               // TheTableViewController().tableView.reloadData()
            }
//            .then{
//               // print(self.theData)
//                
//                
//            }
            .catch
            {
                (error) -> Void in
                print("error getting listenerCount from the server")
        }
        
    }
    
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("------b------", "--------e------")
        if let destinationViewController = segue.destination as? TheTableViewController {
            destinationViewController.data = self.theData
            destinationViewController.searchType = self.searchType
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // turn all switches off
        albumSwitch.setOn(false, animated: true)
        artistSwitch.setOn(false, animated: true)
        labelSwitch.setOn(false, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


