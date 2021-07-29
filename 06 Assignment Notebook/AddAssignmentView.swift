//
//  AddAssignmentView.swift
//  06 Assignment Notebook
//
//  Created by Kareem Almomen on 7/29/21.
//

import SwiftUI
struct AddItemView: View {
    @ObservedObject var assignmentList: AssignmentList
    @State private var description = ""
    @State private var course = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode
    static let description = ["High", "Medium", "Low"]
    struct AddAssignmentView: View {
        var body: some View {
            NavigationView {
                Form {
                    Picker("Description", selection: $description) {
                        ForEach(Self.descriptions, id: \.self) { description in
                            Text(description)
                        }
                    }
                    TextField("Course", text: $course)
                                   DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                }
                .navigationBarTitle("Add New Assignment Item", displayMode: .inline)
                .navigationBarItems(trailing: Button("Save") {
                               if description.count > 0 && course.count > 0 {
                                   let item = AssignmentItem(id: UUID(), description: description,
                                                       course: course, dueDate: dueDate)
                                   assignmentList.items.append(item)
                                   presentationMode.wrappedValue.dismiss()
                               }
                           })
            }
        }
    }
    
    struct AddAssignmentView_Previews: PreviewProvider {
        static var previews: some View {
            AddAssignmentView(assignmentList: AssignmentList())
        }
    }

