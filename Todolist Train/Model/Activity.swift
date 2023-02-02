//
//  Activity.swift
//  Todolist Train
//
//  Created by Putut Yusri Bahtiar on 02/02/23.
//

import Foundation

struct Activity: Codable, Identifiable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var completeCount = 0
    
    static let example = Activity(title: "Title Example", description: "Description Example")
}
