//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Jensen Keele on 1/28/26.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentList = AssignmentList()
    @State private var showingAddItemView = false
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
                        .listRowBackground(Color.black.opacity(0.4))
                    }
                    .onMove(perform: { indices, newOffset in
                        assignmentList.items.move(fromOffsets: indices, toOffset: newOffset)
                    })
                    .onDelete(perform: { indexSet in
                        assignmentList.items.remove(atOffsets: indexSet)
                    })
                }
                .scrollContentBackground(.hidden)
                .listStyle(.plain)
                .navigationBarTitle("Assignment Notebook")
                .sheet(isPresented: $showingAddItemView) {
                    AddAssignmentView()
                        .environment(assignmentList)
                }
                .navigationBarItems(leading: EditButton(),
                                    trailing: Button(action: {
                    showingAddItemView = true
                }, label: {
                    Image(systemName: "plus")
                }))
            }
        }
    }

struct AssignmentItem: Identifiable, Codable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}

#Preview {
    ContentView()
}
