//
//  Connection.swift
//  Todolist Train
//
//  Created by Putut Yusri Bahtiar on 02/02/23.
//

import Foundation

class Connection: ObservableObject {
    @Published var activity: [Activity] {
        didSet {
            if let encode = try? JSONEncoder().encode(activity) {
                UserDefaults.standard.set(encode, forKey: "Activity")
            }
        }
    }
    
    init() {
        if let saved = UserDefaults.standard.data(forKey: "Activity") {
            if let decode = try? JSONDecoder().decode([Activity].self, from: saved) {
                activity = decode
                return
            }
        }
        
        activity = []
    }
}
