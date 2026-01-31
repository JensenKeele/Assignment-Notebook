//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Jensen Keele on 1/30/26.
//

import Foundation

@Observable
class AssignmentList {
    var items =  [AssignmentItem(course: "Algebra",description: "linear Equation", dueDate: Date()),
                  AssignmentItem(course: "History", description: "Paper", dueDate: Date()),
                  AssignmentItem(course: "Biology", description: "Disect some frogs", dueDate: Date())]
}
struct AssignmentItem: Identifiable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}
