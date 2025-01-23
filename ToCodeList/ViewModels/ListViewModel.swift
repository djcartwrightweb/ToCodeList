//
//  ListViewModel.swift
//  ToCodeList
//
//  Created by David Cartwright on 2025-01-23.
//

import Foundation

@Observable class ListViewModel {
    var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    private func getItems() {
        let newItems = [
            ItemModel(title: "item 1", isCompleted: false),
            ItemModel(title: "item 2", isCompleted: true),
            ItemModel(title: "item 3", isCompleted: false),
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from indexSet: IndexSet, to offset: Int) {
        items.move(fromOffsets: indexSet, toOffset: offset)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
}
