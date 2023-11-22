//
//  UserDefaultsError.swift
//  CheckerApp
//
//  Created by 渡邊魁優 on 2023/11/21.
//

import Foundation

enum UserDefaultsError: Error {
    case getFailure
    case decodeError
    case encodeError
    case unknownError
}
