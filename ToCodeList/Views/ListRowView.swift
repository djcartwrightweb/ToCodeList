//
//  ListRowView.swift
//  ToCodeList
//
//  Created by David Cartwright on 2025-01-23.
//


import SwiftUI

struct ListRowView: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
    }
}

#Preview {
    List {
        ListRowView(title: "This is the first title")
    }
}
