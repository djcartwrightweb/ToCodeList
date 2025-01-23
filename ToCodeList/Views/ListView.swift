//
//  ListView.swift
//  ToCodeList
//
//  Created by David Cartwright on 2025-01-23.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
        "this is the first",
        "second",
        "third"
    ]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
            }
        }
        .listStyle(.plain)
        .navigationTitle("ToCodeList 💻")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("add") {
                    AddView()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
}


