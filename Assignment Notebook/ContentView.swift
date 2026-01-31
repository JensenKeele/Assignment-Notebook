//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Jensen Keele on 1/28/26.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentList = AssignmentList()
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentList.items) { item in
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
                    assignmentList.items.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    assignmentList.items.remove(atOffsets: indexSet)
                })
            }
            .navigationBarTitle("Assignment Notebook")
            .navigationBarItems(leading: EditButton())
        }
    }
}

#Preview {
    ContentView()
}
