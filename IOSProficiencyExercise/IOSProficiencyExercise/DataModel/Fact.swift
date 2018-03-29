//
//  Fact.swift
//  IOSProficiencyExercise
//
//  Created by Piumika Welagedara on 29/3/18.
//  Copyright © 2018 Piumika Welagedara. All rights reserved.
//

import Foundation

/*
 Fact structure represents each row element of the JSON structure
 */

struct Fact : Decodable {
    
    let title: String?
    let description: String?
    let imageHref: String?
    
    func titleIsNotNullOrEmpty() -> Bool {
        
        if let title = title ,  title.isEmpty == false {
            return true
        }
        
        return false
        
    }

}
