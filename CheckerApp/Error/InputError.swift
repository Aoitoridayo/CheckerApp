//
//  InputError.swift
//  CheckerApp
//
//  Created by 渡邊魁優 on 2023/11/21.
//

import Foundation

enum InputError: Error {
    case emptyTitle
    case emptyItem
    case unknown
    
    var title: String {
        switch self {
            
        case .emptyTitle:
            return "タイトルが未入力です"
        case .emptyItem:
            return "アイテムが未入力です"
        case .unknown:
            return "不明なエラー"
        }
    }
}
