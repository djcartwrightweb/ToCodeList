//
//  ListRowView.swift
//  ToCodeList
//
//  Created by David Cartwright on 2025-01-23.
//


import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    List {
        ListRowView(item: ItemModel(title: "test 1", isCompleted: true))
        ListRowView(item: ItemModel(title: "test 2", isCompleted: false))
    }
}
