//
//  FactsService.swift
//  IOSProficiencyExercise
//
//  Created by Piumika Welagedara on 29/3/18.
//  Copyright © 2018 Piumika Welagedara. All rights reserved.
//

import Foundation

class FactsService {
    
    let url =  URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json" )
    
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
    
    func decodeJsonData(_ data: Data) -> FactsRoot?{
        
        var decodedResult : FactsRoot? = nil
        do {
            
            let json = String(data: data, encoding: String.Encoding.ascii)!
            decodedResult = try JSONDecoder().decode(FactsRoot.self, from: Data(json.utf8))
            
        } catch let decodeError as NSError {
            print( "JSON Decoding error: \(decodeError.localizedDescription)" )
        }
        
        return decodedResult
    }
    
}
