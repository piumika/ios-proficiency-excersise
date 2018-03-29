//
//  FactsService.swift
//  IOSProficiencyExercise
//
//  Created by Piumika Welagedara on 29/3/18.
//  Copyright © 2018 Piumika Welagedara. All rights reserved.
//

import Foundation

/*
 This Service Class is used for retrieving data from the facts REST webservice
 */

class FactsService {
    
    let url =  URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json" )
    
    /*
     getResults method is used for retrieving data from the webservice. A completiong handler can be provided as an argument. This completion hander will be called once the data retrieval is completed
     */
    
    func getResults(completion: @escaping (_ result: FactsRoot?) -> Void) {
        
        let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url!) { data, response, error in
            
            if let error = error {
                print( "DataTask error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                let results = self.decodeJsonData(data)
                
                completion(results)
            }
            
        }
        task.resume()
    }
    
    /*
     dacodeJsonData is an utility function that is useful for decoding JSON data to a FactsRoot structure
     */
    
    func decodeJsonData(_ data: Data) -> FactsRoot?{
        
        var decodedResult : FactsRoot? = nil
        do {
            
            let json = String(data: data, encoding: String.Encoding.ascii)!
            decodedResult = try JSONDecoder().decode(FactsRoot.self, from: Data(json.utf8))
            
        } catch let decodeError as NSError {
            print( "JSON Decoding error: \(decodeError.localizedDescription)" )
        }
        
        
        if var result = decodedResult {
            result.removeEmptyFacts()
            return result
        }
        
        return decodedResult
    }
    
}
