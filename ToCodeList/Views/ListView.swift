//
//  ListView.swift
//  ToCodeList
//
//  Created by David Cartwright on 2025-01-23.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "item 1", isCompleted: false),
        ItemModel(title: "item 2", isCompleted: true),
        ItemModel(title: "item 3", isCompleted: false),
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .listStyle(.plain)
        .padding(.top)
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


