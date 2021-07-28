//
//  ContentView.swift
//  06 Assignment Notebook
//
//  Created by Kareem Almomen on 7/28/21.
//

import SwiftUI

struct ContentView: View {
    @State private var assignments =
        [AssignmentItem(description: "Math Homework", course: "Math", dueDate: Date()),
         AssignmentItem(description: "Science Homework", course: "Science", dueDate: Date()),
         AssignmentItem(description: "History Homework", course: "History", dueDate: Date())]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(assignments) { assignment in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(assignment.description)
                                .font(.headline)
                            Text(assignment.course)
                        }
                        Spacer()
                        Text(assignment.dueDate, style: .date)
                    }
                    
                }
                .onMove(perform: { indices, newOffset in assignments.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    assignments.remove(atOffsets: indexSet)
                })
                
            }
            .navigationBarTitle("Assignment Notebook", displayMode: .inline)
            .navigationBarItems(leading: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct AssignmentItem: Identifiable {
    var id = UUID()
    var description = String()
    var course = String()
    var dueDate = Date()
}
