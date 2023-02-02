//
//  ActivityView.swift
//  Todolist Train
//
//  Created by Putut Yusri Bahtiar on 02/02/23.
//

import SwiftUI

struct ActivityView: View {
    @ObservedObject var data: Connection
    var activity: Activity
    
    var body: some View {
        List {
            Section {
                if activity.description.isEmpty == false {
                    Text(activity.description)
                }
            }
            
            Section {
                Text("Complete :\(activity.completeCount)")
                
                Button("Complete") {
                    var newActivity = activity
                    newActivity.completeCount += 1
                    
                    if let index = data.activity.firstIndex(of: activity) {
                        data.activity[index] = newActivity
                        
                    }
                }
            }
            
            Section {
                if activity.completeCount >= 1 {
                    
                    Text("Good Job you Did it")
                    Image("good")
                        .resizable()
                        .frame(width: 200, height: 200)
                } else {
                    Image("dontgiveup")
                        .resizable()
                        .frame(width: 200, height: 200)
                }
            }
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(data: Connection(), activity: Activity.example)
    }
}
