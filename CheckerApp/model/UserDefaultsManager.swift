//
//  UserDefaultsManager.swift
//  CheckerApp
//
//  Created by 渡邊魁優 on 2023/11/21.
//

import Foundation

class UserDefaultsManager {
    
    private init(){}
    static public let shared = UserDefaultsManager()
    
    let userDefaults = UserDefaults.standard
    
    public func set(ivents: [Ivent], key: String) throws {
        guard let json = encode(item: ivents) else {
            throw UserDefaultsError.encodeError
        }
        userDefaults.set(json, forKey: key)
    }
    
    public func get(key: String) throws -> [Ivent] {
        guard let json = userDefaults.string(forKey: key) else {
            throw UserDefaultsError.getFailure
        }
        guard let ivents = decode(json: json) else {
            throw UserDefaultsError.decodeError
        }
        return ivents
    }
    
    private func encode<T: Encodable>(item: [T]) -> String? {
        do {
            let data = try JSONEncoder().encode(item)
            guard let json = String(data: data, encoding: .utf8) else {
                return nil
            }
            return json
        } catch {
            return nil
        }
    }
    
    private func decode(json: String) -> [Ivent]? {
        do {
            guard let data = json.data(using: .utf8) else {
                return nil
            }
            let ivents = try JSONDecoder().decode([Ivent].self, from: data)
            return ivents
        } catch {
            return nil
        }
    }
}
