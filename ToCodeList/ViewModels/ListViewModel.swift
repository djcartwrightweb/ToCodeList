//
//  ListViewModel.swift
//  ToCodeList
//
//  Created by David Cartwright on 2025-01-23.
//

import Foundation

@Observable class ListViewModel {
    var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "code_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard let data = UserDefaults.standard.data(forKey: itemsKey),
              let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) else {
            return
        }
        items = savedItems
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
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
    
}
