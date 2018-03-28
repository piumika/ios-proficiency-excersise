//
//  LazyLoadingImageView.swift
//  IOSProficiencyExercise
//
//  Created by Piumika Welagedara on 29/3/18.
//  Copyright © 2018 Piumika Welagedara. All rights reserved.
//


import Foundation
import UIKit

extension UIImageView {
    func downloadImageFrom(link:String, contentMode: UIViewContentMode) {
        URLSession.shared.dataTask( with: NSURL(string:link)! as URL, completionHandler: {
            (data, response, error) -> Void in
            DispatchQueue.main.async {
                self.contentMode =  contentMode
                if let data = data { self.image = UIImage(data: data) }
            }
        }).resume()
    }
}
