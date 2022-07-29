//
//  Goal.swift
//  EatTheFrog
//
//  Created by Marcelino Budiman on 24/07/22.
//

import Foundation

class goal : ObservableObject{
    @Published var goalName: String = ""
    @Published var goalDescription: String = ""
    @Published var goalDeadline: Date = Date()
}
