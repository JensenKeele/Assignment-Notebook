//
//  AddAssignmentView.swift
//  Assignment Notebook
//
//  Created by Jensen Keele on 1/31/26.
//

import SwiftUI

struct AddAssignmentView: View {
    @Environment(AssignmentList.self) var assignmentList
    @Environment(\.dismiss) var dismiss
    static let courses = ["Chemistry", "Mobile App Development", "APUSH", "AP Seminar", "Math"]
    @State private var course = ""
    @State private var description = ""
    @State private var dueDate = Date()
    var body: some View {
        NavigationView {
            Form {
                Picker("Course", selection: $course) {
                    ForEach(Self.courses, id: \.self) { course in
                        Text(course)
                    }
                }
                TextField("Description", text: $description)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            .navigationBarTitle("Add New Assignment", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save") {
                if course.count > 0, description.count > 0 {
                    let item = AssignmentItem(course: course, description: description, dueDate: dueDate)
                    assignmentList.items.append(item)
                    dismiss()
                }
            })
        }
    }
}

#Preview {
    ContentView()
}
