//
//  HighSchoolItemView.swift
//  20210607-RileyDurbin-NYCSchools
//
//  Created by Riley Durbin on 6/8/21.
//

import SwiftUI

struct HighSchoolItemView: View {
    var highschool: HighSchool
    
    var body: some View {
        NavigationLink(
            destination: HighSchoolDetail(highschool: highschool),
            label: {
                Text(highschool.name)
            }
        )
    }
}
