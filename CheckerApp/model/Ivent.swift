//
//  Ivent.swift
//  CheckerApp
//
//  Created by 渡邊魁優 on 2023/11/21.
//

import Foundation

struct Ivent: Identifiable, Decodable {
    let title: String
    let items: [Item]
    
    var id: String { title }
}
