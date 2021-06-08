//
//  InformationLoader.swift
//  20210607-RileyDurbin-NYCSchools
//
//  Created by Riley Durbin on 6/7/21.
//

import Foundation
import SwiftCSV

class InformationLoader {
    
    static func load() {
        do {
            
            // Grab the paths of CSVs
            guard let highSchoolsCSVPath = Bundle.main.path(forResource: "HighSchools", ofType: "csv") else {
                print("Error loading HighSchools.csv file")
                return
            }
            
            guard let satResultsCSVPath = Bundle.main.path(forResource: "SATResults", ofType: "csv") else {
                print("Error loading SATResults.csv file")
                return
            }
            
            // Use the SwiftCSV library to parse them into CSV objects
            let highSchoolsCSV: CSV = try CSV(url: URL(fileURLWithPath: highSchoolsCSVPath))
            let satResultsCSV: CSV = try CSV(url: URL(fileURLWithPath: satResultsCSVPath))
            
            // Save the information from the CSVs to HighSchoolDictionary.swift
            try saveHighSchools(csv: highSchoolsCSV)
            try saveSATResults(csv: satResultsCSV)
                        
        } catch let parseError as CSVParseError {
            print(parseError.localizedDescription)
        } catch {
            print("Error loaded files")
        }
    }
    
    static func saveHighSchools(csv: CSV) throws {
        // Add all High Schools in the Dictionary from the HighSchools.csv file
        try csv.enumerateAsDict { dict in
            let dbn = dict["dbn"] ?? ""
            let name = dict["school_name"] ?? ""
            let overview = dict["overview_paragraph"] ?? ""
            
            let newHS = HighSchool(id: dbn, name: name, overview: overview)
            HighSchoolDictionary.addSchool(school: newHS)
        }
    }
    
    static func saveSATResults(csv: CSV) throws {
        // Set the values of the High School's scores from the SATResults.csv file
        try csv.enumerateAsDict { dict in
            // Fetch the HighSchool object from the Dict
            if var highSchool = HighSchoolDictionary.dict[dict["DBN"]!] {
                
                // Update the values of the high school object
                highSchool.numberOfTestTakers = dict["Num of SAT Test Takers"] ?? "No information"
                highSchool.criticalReadingAvgScore = dict["SAT Critical Reading Avg. Score"] ?? "No information"
                highSchool.mathAverageScore = dict["SAT Math Avg. Score"] ?? "No information"
                highSchool.writingAvgScore = dict["SAT Writing Avg. Score"] ?? "No information"
                
                // Update the high school object in the Dict
                HighSchoolDictionary.dict[dict["DBN"]!] = highSchool
            }
        }
    }
    
}
