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
    
    func getData(searchTerm:String, searchType:String)
    {
        let query = searchTerm.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        Alamofire.request("https://musicbrainz.org/ws/2/"+searchType+"/?fmt=json&query="+query!).responseJSON { response in
            
            if let result = response.result.value {
                let data = JSON(result)
                print(data)
            }
        }
    }
    
    func getJSON(searchTerm:String, searchType:String)->Promise<JSON>
    {
       let query = searchTerm.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        return Promise { fulfill, reject in
            Alamofire.request("https://musicbrainz.org/ws/2/"+searchType+"/?fmt=json&query="+query!).validate(statusCode: 200..<300).responseJSON
            { (response) -> Void in
                switch response.result
                {
                case .success:
                    if let result = response.result.value {
                        fulfill(JSON(result))
                    }
                case .failure(let error):
                    reject(error)
                    
                }
            }
        }
    }
    func getAlbumsFromArtist(mbid:String) -> Promise<JSON>
    {
        return Promise { fulfill, reject in
            Alamofire.request("http://musicbrainz.org/ws/2/artist/"+mbid+"?inc=recordings&fmt=json").validate(statusCode: 200..<300).responseJSON
                { (response) -> Void in
                    switch response.result
                    {
                    case .success:
                        if let result = response.result.value {
                            fulfill(JSON(result))
                        }
                    case .failure(let error):
                        reject(error)
                        
                    }
            }
        }

        
    }




//    func callGetJSON(searchTerm:String, searchType:String)->JSON
//    {
//        
//        
//        
//    }
    
}




