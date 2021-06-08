//
//  HighSchoolDictionary.swift
//  20210607-RileyDurbin-NYCSchools
//
//  Created by Riley Durbin on 6/7/21.
//

import Foundation

class HighSchoolDictionary {
    
    static var dict: [String: HighSchool] = [String: HighSchool]()
    
    static func addSchool(school: HighSchool) {
        dict[school.id] = school
    }
    
    static func removeSchool(school: HighSchool) {
        dict.removeValue(forKey: school.id)
    }
    
    static func getHighSchool(id: String) -> HighSchool? {        
        return self.dict[id]
    }
    
}

// Conform String to Error so we can throw custom error messages
extension String: Error {}
