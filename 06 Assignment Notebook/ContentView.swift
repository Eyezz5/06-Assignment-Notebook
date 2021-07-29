//
//  ContentView.swift
//  06 Assignment Notebook
//
//  Created by Kareem Almomen on 7/28/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var assignmentList = AssignmentList()
    @State private var showingAddAssignmentView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentList.items) { assignment in
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
                .onMove(perform: { indices, newOffset in assignmentList.items.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    assignmentList.items.remove(atOffsets: indexSet)
                })
                
            }
            .sheet(isPresented: $showingAddAssignmentView, content: {
                AddItemView(toDoList: assignmentList)
            })
            .navigationBarTitle("Assignment Notebook", displayMode: .inline)
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: {
                                                    showingAddAssignmentView = true}) {
                                    Image(systemName: "plus")
                                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct AssignmentItem: Identifiable, Codable {
    var id = UUID()
    var description = String()
    var course = String()
    var dueDate = Date()
}
