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

    @IBAction func pressedSearchButton(_ sender: AnyObject) {
        print("button pressed")
        if let theSearchTerm = self.searchField.text{
        getData(searchTerm: theSearchTerm, searchType: "artist")
        }
        print(self.searchField.text!)
    }
    
    
    let BASE_URL = "http://musicbrainz.org/ws/2/"
    let format_query = "?fmt=json&query="
    
    func getData(searchTerm:String, searchType:String){
        let query = searchTerm.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        Alamofire.request("https://musicbrainz.org/ws/2/"+searchType+"/?fmt=json&query="+query!).responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
//            if let JSON = response.result.value {
//                print("JSON: \(JSON)")
//            }
            if let result = response.result.value {
//                let JSON = result
                let data = JSON(result)
//                let list = JSON["artist"] as! NSArray
                print(data["artists"][0])
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

