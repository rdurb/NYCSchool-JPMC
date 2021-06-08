//
//  HighSchool.swift
//  20210607-RileyDurbin-NYCSchools
//
//  Created by Riley Durbin on 6/7/21.
//

import Foundation


class HighSchool: Identifiable, Decodable {
    // Information about the school
    var id: String
    var name: String
    var overview: String
    
    // Information about the test
    var numberOfTestTakers: String
    var criticalReadingAvgScore: String
    var mathAverageScore: String
    var writingAvgScore: String
    
    init(id: String, name: String, overview: String) {
        self.id = id
        self.name = name
        self.overview = overview
        
        // Initialize as "No Information", will be set later
        self.numberOfTestTakers = "No information"
        self.criticalReadingAvgScore = "No information"
        self.mathAverageScore = "No information"
        self.writingAvgScore = "No information"
    }
}
