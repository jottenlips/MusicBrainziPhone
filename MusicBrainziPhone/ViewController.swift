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

class ViewController: UIViewController {
    //constants
    let BASE_URL = "http://musicbrainz.org/ws/2/"
    let format_query = "?fmt=json&query="
    var theData = Auth().getJSON(searchTerm: "Prince", searchType: "artist")
    
    @IBOutlet weak var artistProducerSwitch: UISwitch!
    @IBOutlet weak var searchField: UITextField!

    @IBOutlet weak var artistSwitch: UISwitch!
    @IBOutlet weak var albumSwitch: UISwitch!
    @IBOutlet weak var labelSwitch: UISwitch!
    
    
    
    @IBAction func pressedSearchButton(_ sender: AnyObject) {
        var searchType = "artist"
        if (artistSwitch.isOn){
            searchType = "artist"
            // call getdata, store JSON in a list variable
        }
        if (albumSwitch.isOn){
            searchType = "release-group"
            // call getdata, store JSON in a list variable
        }
        if (labelSwitch.isOn){
            searchType = "label"
            // call getdata, store JSON in a list variable
        }
        print("button pressed")
        if let theSearchTerm = self.searchField.text{
        let json = Auth().getJSON(searchTerm: theSearchTerm, searchType: searchType)
        print(json)
//        theData = json
        }
        print(self.searchField.text!)
    }
    
   
    
    //structure to hold the json data and pass to the next view
    struct theData{
        let json:JSON
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

