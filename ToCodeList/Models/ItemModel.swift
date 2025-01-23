//
//  ItemModel.swift
//  ToCodeList
//
//  Created by David Cartwright on 2025-01-23.
//

import Foundation

struct ItemModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
