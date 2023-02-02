//
//  AddActivity.swift
//  Todolist Train
//
//  Created by Putut Yusri Bahtiar on 02/02/23.
//

import SwiftUI

struct AddActivity: View {
    @ObservedObject var data: Connection
    @State private var title = ""
    @State private var description = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add Activity")
            .toolbar{
                Button("Save") {
                    let activity = Activity(title: title, description: description)
                    data.activity.append(activity)
                    dismiss()
                }
            }
        }
    }
}

struct AddActivity_Previews: PreviewProvider {
    static var previews: some View {
        AddActivity(data: Connection())
    }
}
