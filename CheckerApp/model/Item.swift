//
//  Item.swift
//  CheckerApp
//
//  Created by 渡邊魁優 on 2023/11/21.
//

import Foundation

struct Item: Identifiable, Decodable {
    var id = UUID()
    let name: String
}
