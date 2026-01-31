//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Jensen Keele on 1/30/26.
//

import Foundation

@Observable
class AssignmentList {
    var items : [AssignmentItem] {
        didSet {
            if let encodedData = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encodedData, forKey: "assignments")
            }
        }
    }
    init() {
        if let data = UserDefaults.standard.data(forKey: "assignments") {
            if let decodedData = try? JSONDecoder().decode([AssignmentItem].self, from: data) {
                items = decodedData
                return
            }
        }
        items = []
    }
}

