//
//  DetailedViewController.swift
//  MusicBrainziPhone
//
//  Created by John Ottenlips on 1/13/17.
//  Copyright © 2017 jottenlips. All rights reserved.
//

import UIKit
import SwiftyJSON

//http://musicbrainz.org/ws/2/artist/d24c555c-318d-4fa3-bcf9-a250475cf0af?inc=recordings
// albums of a particular artist!!!

class DetailedViewController: UIViewController {
    @IBOutlet weak var name: UILabel!
    var data:JSON!
    var indexNumber:Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        if (data) != nil {
        self.name.text = String( describing: data["artists"][indexNumber]["name"])
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
