//
//  IventData.swift
//  CheckerApp
//
//  Created by 渡邊魁優 on 2023/11/21.
//

import Foundation

class IventData: ObservableObject {
    @Published var ivents: [Ivent] = [
        Ivent(title: "バイト", items: [
            Item(name: "名札"),
            Item(name: "制服"),
            Item(name: "免許書")
        ])
    ]
    @Published var isCreateIventView = false
    
    func didTapIventPlusButton() {
        self.isCreateIventView = true
    }
    func didTapExecutionButton() {}
    func didTapIventDeleteButton() {}
    func didTapSaveButton(ivent: Ivent) {
        self.ivents.append(ivent)
        self.isCreateIventView = false
    }
    func didTapCancelButton() {
        self.isCreateIventView = false
    }
    private func saveData() {}
}
