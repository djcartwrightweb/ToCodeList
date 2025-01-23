//
//  ListView.swift
//  ToCodeList
//
//  Created by David Cartwright on 2025-01-23.
//

import SwiftUI

struct ListView: View {
    
    @Environment(ListViewModel.self) private var vm
    
    
    var body: some View {
        List {
            ForEach(vm.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            vm.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: vm.deleteItem)
            .onMove(perform: vm.moveItem)
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
    .environment(DeveloperPreview.shared.vm)
}


