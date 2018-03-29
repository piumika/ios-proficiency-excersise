//
//  FactsRoot.swift
//  IOSProficiencyExercise
//
//  Created by Piumika Welagedara on 29/3/18.
//  Copyright © 2018 Piumika Welagedara. All rights reserved.
//

import Foundation

/*
 FactsRoot structure represents the root object of the JSON structure
 */

struct FactsRoot : Decodable {
    
    var rows : [Fact]
    let title: String
    
    mutating func removeEmptyFacts()  {
        self.rows = rows.filter { $0.titleIsNotNullOrEmpty()}
    }
    
}
