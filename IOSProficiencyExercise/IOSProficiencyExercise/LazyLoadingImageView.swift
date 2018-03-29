//
//  LazyLoadingImageView.swift
//  IOSProficiencyExercise
//
//  Created by Piumika Welagedara on 29/3/18.
//  Copyright © 2018 Piumika Welagedara. All rights reserved.
//


import Foundation
import UIKit

/*
 UIImageView extension that supports lazy loding of images
 */

extension UIImageView {
    
    /*
     Method for dowloading the image aysynchronously from the link that is provided. Once the image is downloaded the ImageView image will be replaced with the downloaded image.
     */
    func downloadImageFrom(link:String, contentMode: UIViewContentMode) {
        URLSession.shared.dataTask( with: NSURL(string:link)! as URL, completionHandler: {
            (data, response, error) -> Void in
            
            if let error = error {
                print( "Error in loading image with url: \(link) error: \(error.localizedDescription)")
                return
            }
            
            if let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                DispatchQueue.main.async {
                    self.contentMode =  contentMode
                    self.image = UIImage(data: data)
                }
                return
            }
            
            print( "Error in loading image with url: \(link)")
            
        }).resume()
    }
}
