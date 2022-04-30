//
//  ContentView.swift
//  Add-remove-movie-tasks-listSwiftUI
//
//  Created by naresh kukkala on 30/04/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var taskName: String = ""
    @State private var tasks: [String] = []
    
    private func deleteTask(indexSet: IndexSet) {
        indexSet.forEach { index in
            tasks.remove(at: index)
        }
    }
    
    private func moveTask(from source: IndexSet, to destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                HStack {
                    TextField("Enter task name", text: $taskName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Add Task") {
                        tasks.append(taskName)
                        taskName = ""
                    }
                }
                
                List {
                    
                    ForEach(tasks, id: \.self) { task in
                        Text(task)
                    }.onDelete(perform: deleteTask)
                    .onMove(perform: moveTask)
                    
                }.listStyle(PlainListStyle())
                .toolbar {
                    EditButton()
                }
                
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
