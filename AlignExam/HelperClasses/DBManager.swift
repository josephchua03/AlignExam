//
//  DatabaseHelp.swift
//  AlignExam
//
//  Created by Joseph Chua on 18/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import Foundation
import FMDB

class DBManager {
    static let shared = DBManager()
    let databaseFileName = "database.sqlite"
    var finalDatabaseURL:URL = URL(fileURLWithPath:"")
    var database: FMDatabase! = FMDatabase()
    
    init() {
        copyDatabaseIfNeeded()
        getSeatList()
    }
    
    func openDatabase(){
        database = FMDatabase(url: finalDatabaseURL)
        database.open()
    }
    
    func copyDatabaseIfNeeded() {
        let fileManager = FileManager.default
        guard let documentsUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        finalDatabaseURL = documentsUrl.appendingPathComponent("database.sqlite")
        do {
            if !fileManager.fileExists(atPath: finalDatabaseURL.path) {
                print("DB does not exist in documents folder")
                
                if let dbFilePath = Bundle.main.path(forResource: "database", ofType: "sqlite") {
                    try fileManager.copyItem(atPath: dbFilePath, toPath: finalDatabaseURL.path)
                } else {
                }
            }
        } catch {
            print("Unable to copy db: \(error)")
        }
    }
    
    func callQuery(query:String) -> Any?{
        openDatabase()
        do {
            let results = try database.executeQuery(query, values: [])
            database.close()
            return results
            
        }catch {
            database.close()
            return nil
        }
    }
    
    
    
    
}
