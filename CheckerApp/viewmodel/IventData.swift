//
//  IventData.swift
//  CheckerApp
//
//  Created by 渡邊魁優 on 2023/11/21.
//

import Foundation

class IventData: ObservableObject {
    @Published var ivents: [Ivent] = []
    @Published var isCreateIventView = false

    let userDefautsManager = UserDefaultsManager.shared
    
    public func didTapIventPlusButton() {
        self.isCreateIventView = true
    }
    public func didTapExecutionButton() {

    }
    public func didTapDeleteButton() {
        self.ivents = []
        self.saveData()
    }
    public func didTapIventDeleteButton(ivent: Ivent) {
        guard let index = ivents.firstIndex(where: { $0.id == ivent.id }) else {
            return
        }
        self.ivents.remove(at: index)
        self.saveData()
    }
    public func didTapSaveButton(ivent: Ivent) {
        self.ivents.append(ivent)
        self.saveData()
        self.isCreateIventView = false
    }
    public func didTapCancelButton() {
        self.isCreateIventView = false
    }
    public func onAppear() {
        do {
            let result = try userDefautsManager.get(key: "key")
            self.ivents = result
        } catch {
            let error = error as? UserDefaultsError ?? UserDefaultsError.unknownError
            print(error)
        }
    }
    
    private func saveData() {
        do {
            try userDefautsManager.set(ivents: ivents, key: "key")
        } catch {
            let error = error as? UserDefaultsError ?? UserDefaultsError.unknownError
            print(error)
        }
    }
}
