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
        Auth().getData(searchTerm: theSearchTerm, searchType: searchType)
        }
        print(self.searchField.text!)
    }
    
    
    let BASE_URL = "http://musicbrainz.org/ws/2/"
    let format_query = "?fmt=json&query="
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

