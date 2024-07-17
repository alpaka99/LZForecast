//
//  FileManager.swift
//  LZForecast
//
//  Created by user on 7/15/24.
//

import Foundation

final class FileManager {
    static let shared = FileManager()
    private init () { 
        CustomReferenceCounter.shared.increment(name:  String(describing: type(of: self)))
    }
    
    func fetchFileData<T: Codable>(fileName: String, type: T.Type) -> Result<T, Error> {
        let url = Bundle.main.url(forResource: fileName, withExtension: "json")
        
        guard let url = url else { return .failure(NSError(domain: "URL Creation Error", code: 1)) }
        
        do {
            let fetchedData = try Data(contentsOf: url)
            
            let decodedData = try JSONDecoder().decode(T.self, from: fetchedData)
            
            return .success(decodedData)
        } catch {
            print("Data fetch failed")
            return .failure(error)
        }
    }
    
    deinit {
        CustomReferenceCounter.shared.decrement(name: String(describing: type(of: self)))
    }
}
