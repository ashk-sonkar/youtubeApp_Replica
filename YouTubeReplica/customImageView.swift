//
//  customImageView.swift
//  YouTubeReplica
//
//  Created by Ashish Kumar Sonkar on 17/09/17.
//  Copyright © 2017 Ashish Kumar Sonkar. All rights reserved.
//

import UIKit
let imageCache = NSCache<AnyObject, AnyObject>()

class customImageView: UIImageView {

    func loadImageUsingUrl(urlString: String){
        
        let url = URL(string: urlString)
        
        //image = nil
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage{
             self.image = imageFromCache
             print("Into the store")
             return
        }
        
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            if error != nil {
                
               // print(error )
                return
            }
            
            DispatchQueue.main.async(execute: {
                
                let imageToCache = UIImage(data: data!)
                imageCache.setObject(imageToCache!, forKey: urlString as AnyObject )
                
                self.image = UIImage(data: data!)
            })
        }).resume()

        
    }

}
