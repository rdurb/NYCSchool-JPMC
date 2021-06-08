//
//  HighSchoolListView.swift
//  20210607-RileyDurbin-NYCSchools
//
//  Created by Riley Durbin on 6/7/21.
//

import SwiftUI

struct HighSchoolListView: View {
    
    // Get the list of high schools from the Dict and sort them alphabetically
    var highschools: [String: HighSchool] = HighSchoolDictionary.dict
        
    // The text in our search bar
    // TODO: The search bar becomes unselected after each character that gets typed in it. Typically I would research why this happens a find a fix for it.
    @State var searchText: String = ""
    
    var body: some View {
        NavigationView {
            List {
                
                TextField("Search", text: $searchText)
                    .cornerRadius(8)
                    .padding(7)
                
                // Sort the High Schools alphabetically
                let sortedValues = highschools.map { $0.value }.sorted(by: { $0.name < $1.name })
                
                // Display the list of high schools
                ForEach(sortedValues) { highschool in
                    if (searchText.isEmpty || highschool.name.localizedStandardContains(searchText)) {
                        HighSchoolItemView(highschool: highschool)
                    }
                }
            }
            .id(UUID())     // hack that improves performance of the List
            .navigationBarTitle("High Schools", displayMode: .large)
        }
        
    }
}
