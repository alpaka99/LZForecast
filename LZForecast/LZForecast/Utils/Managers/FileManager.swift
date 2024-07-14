//
//  FileManager.swift
//  LZForecast
//
//  Created by user on 7/15/24.
//

import Foundation

final class FileManager {
    static let shared = FileManager()
    private init () { }
    
    func fetchFileData<T: Codable>(fileName: String, type: T.Type) -> T? {
        let url = Bundle.main.url(forResource: fileName, withExtension: "json")
        
        guard let url = url else { return nil }
        
        do {
            let fetchedData = try Data(contentsOf: url)
            
            let decodedData = try JSONDecoder().decode(T.self, from: fetchedData)
            
            return decodedData
        } catch {
            print("Data fetch failed")
            print(error)
        }
        
        return nil
    }
}
