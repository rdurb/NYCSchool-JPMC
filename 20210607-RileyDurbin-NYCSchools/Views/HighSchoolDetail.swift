//
//  HighSchoolInformationView.swift
//  20210607-RileyDurbin-NYCSchools
//
//  Created by Riley Durbin on 6/7/21.
//

import SwiftUI

struct HighSchoolDetail: View {
    var highschool: HighSchool
    
    var body: some View {
        // We are wrapping the content in a List to make it scrollable
        List {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading) {
                    Text("ID")
                        .font(.title2)
                    Text(highschool.id)
                        .font(.body)
                    Divider()
                }
                
                VStack(alignment: .leading) {
                    Text("Name")
                        .font(.title2)
                    Text(highschool.name)
                        .font(.body)
                    Divider()
                }
                
                VStack(alignment: .leading) {
                    Text("Overview")
                        .font(.title2)
                    Text(highschool.overview)
                        .font(.body)
                    Divider()
                }
                
                VStack(alignment: .center) {
                    
                    VStack {
                        Text("Number of Test Takers")
                            .font(.title3)
                            .padding(.top, 3)
                        Text(highschool.numberOfTestTakers)
                            .padding(5)
                            .border(Color.black, width: 1)
                            
                    }
                    .padding(.bottom, 10)
                    
                    HStack {
                        VStack {
                            Text("Reading")
                                .font(.title3)
                            Text(highschool.criticalReadingAvgScore)
                                .padding(5)
                                .border(Color.black, width: 1)
                        }
                        
                        Spacer()
                        
                        VStack{
                            Text("Math")
                                .font(.title3)
                            Text(highschool.mathAverageScore)
                                .padding(5)
                                .border(Color.black, width: 1)
                        }
                        
                        Spacer()
                        
                        VStack{
                            Text("Writing")
                                .font(.title3)
                            Text(highschool.writingAvgScore)
                                .padding(5)
                                .border(Color.black, width: 1)
                        }
                    }
                    .padding(.bottom, 8)
                }
            }
        }
    }
}
