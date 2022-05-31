//
//  StatisticModel.swift
//  Crypto(swiftUI2)
//
//  Created by Drum, Jesse on 5/27/22.
//

import Foundation

struct StatisticModel {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?

    init(title: String, value: String, percentageChange: Double?) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
    
    
}



let newModel = StatisticModel(title: "", value: "", percentageChange: nil)
let newModel2 = StatisticModel(title: <#T##String#>, value: <#T##String#>, percentageChange: <#T##Double?#>)
