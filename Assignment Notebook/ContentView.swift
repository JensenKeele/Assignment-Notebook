//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Jensen Keele on 1/28/26.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentItems =
    [AssignmentItem(course: "Algebra",description: "linear Equation", dueDate: Date()),
     AssignmentItem(course: "History", description: "Paper", dueDate: Date()),
     AssignmentItem(course: "Biology", description: "Disect some frogs", dueDate: Date())]
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentItems) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.course).font(.headline)
                            Text(item.description)
                        }
                        Spacer()
                        Text(item.dueDate, style: .date)
                    }
                }
                .onMove(perform: { indices, newOffset in
                    assignmentItems.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    assignmentItems.remove(atOffsets: indexSet)
                })
            }
            .navigationBarTitle("Assignment Notebook")
            .navigationBarItems(leading: EditButton())
        }
    }
    struct AssignmentItem: Identifiable {
        var id = UUID()
        var course = String()
        var description = String()
        var dueDate = Date()
    }
}

#Preview {
    ContentView()
}
