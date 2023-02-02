//
//  ContentView.swift
//  Todolist Train
//
//  Created by Putut Yusri Bahtiar on 02/02/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data = Connection()
    @State private var addingnewActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data.activity) { activities in
                    NavigationLink {
                        ActivityView(data: data, activity: activities)
                    } label: {
                        HStack {
                            Text(activities.title)
                            
                            Spacer()
                            
                            Text(String(activities.completeCount))
                                .font(.caption.weight(.black))
                                .foregroundColor(.white)
                                .padding(5)
                                .frame(minWidth: 50)
                                .background(color(for: activities))
                                .clipShape(Capsule())
                        }
                    }
                }.onDelete(perform: remove)
            }
            .navigationTitle("ToDo Now")
            .toolbar {
                Button {
                    addingnewActivity.toggle()
                } label: {
                    Label("Add new activity", systemImage: "plus")
                }
            }
        }.sheet(isPresented: $addingnewActivity) {
            AddActivity(data: data)
        }
    }
    
    func color(for activity: Activity) -> Color {
        if activity.completeCount < 1 {
            return .red
        } else {
            return .green
        }
    }
    
    func remove(at offsets: IndexSet) {
        data.activity.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
