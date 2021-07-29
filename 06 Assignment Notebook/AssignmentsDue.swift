//
//  AssignmentsDue.swift
//  06 Assignment Notebook
//
//  Created by Kareem Almomen on 7/28/21.
//

import Foundation

class ToDoList: ObservableObject {
    @Published var items = [AssignmentItem(description: "High", course: "Take out trash", dueDate: Date()),
                            AssignmentItem(description: "Medium", course: "Pick up clothes", dueDate: Date()),
                           AssignmentItem(description: "Low", course: "Eat a donut", dueDate: Date())]
}
