//
//  IventData.swift
//  CheckerApp
//
//  Created by 渡邊魁優 on 2023/11/21.
//

import Foundation

class IventData: ObservableObject {
    @Published var ivents: [Ivent] = [
        //        Ivent(title: "バイトへ行く", items: [
        //            Item(name: "名札"),
        //            Item(name: "制服"),
        //            Item(name: "免許書")
        //        ]),
        //        Ivent(title: "学校へ行く", items: [
        //            Item(name: "筆記用具"),
        //            Item(name: "学生証")
        //        ])
    ]
    @Published var isCreateIventView = false
    @Published var isExecution = false
    
    public func didTapIventPlusButton() {
        self.isCreateIventView = true
    }
    public func didTapExecutionButton() {
        isExecution = true
    }
    public func didTapIventDeleteButton(ivent: Ivent) {
        guard let index = ivents.firstIndex(where: { $0.id == ivent.id }) else {
            return
        }
        self.ivents.remove(at: index)
    }
    public func didTapSaveButton(ivent: Ivent) {
        self.ivents.append(ivent)
        self.isCreateIventView = false
    }
    public func didTapCancelButton() {
        self.isCreateIventView = false
    }
    private func saveData() {}
}
