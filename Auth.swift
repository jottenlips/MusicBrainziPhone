//
//  Auth.swift
//  MusicBrainziPhone
//
//  Created by John Ottenlips on 12/14/16.
//  Copyright © 2016 jottenlips. All rights reserved.
//

import Foundation
import NXOAuth2Client
import SwiftyJSON
import Alamofire
import PromiseKit


class Auth{
    
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
                print(data["artists"])
            }
        }
    }
    
    func getJSON(searchTerm:String, searchType:String)->Promise<JSON>{
       let query = searchTerm.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        return Promise { fulfill, reject in
        Alamofire.request("https://musicbrainz.org/ws/2/"+searchType+"/?fmt=json&query="+query!).responseJSON { response in
            
            let serverResponse = response.response
            if((serverResponse?.statusCode)! < 200 || (serverResponse?.statusCode)! > 299) {
                let error = NSError(domain: "http", code: 123, userInfo: ["errorDescription":"Server answers with a wrong status."])
                reject(error)
            }

            
            if let result = response.result.value {
                //                let JSON = result
                let data = JSON(result)
                //                let list = JSON["artist"] as! NSArray
                
                fulfill(data)
                }
            }
    
        }
    }

}
