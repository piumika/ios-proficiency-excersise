//
//  FactsRoot.swift
//  IOSProficiencyExercise
//
//  Created by Piumika Welagedara on 29/3/18.
//  Copyright © 2018 Piumika Welagedara. All rights reserved.
//

import Foundation

struct FactsRoot : Decodable {
    
    var rows : [Fact]
    let title: String
    
}
