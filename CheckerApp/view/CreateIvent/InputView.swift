//
//  InputView.swift
//  CheckerApp
//
//  Created by 渡邊魁優 on 2023/11/21.
//

import SwiftUI

struct InputView: View {
    @State private var isInputItem = false
    @State private var isAlert = false
    @State private var message = ""
    
    @State var title: String = ""
    @State var newItem = ""
    @State var items: [Item] = []
    
    let save: (Ivent) -> Void
    let cancel: () -> Void
    
    var body: some View {
        NavigationStack {
            List {
                Section("イベント名") {
                    TextField("タイトル", text: $title)
                        .keyboardType(.default)
                }
                Section("チェックする項目") {
                    ForEach(items) { item in
                        Text(item.name)
                    }
                    HStack {
                        Spacer()
                        Button(action: {
                            self.isInputItem = true
                        }) {
                            Image(systemName: "plus")
                                .imageScale(.large)
                    }
                        Spacer()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("キャンセル") {
                        cancel()
                    }
                }
                ToolbarItem {
                    Button("保存") {
                        do {
                            try check()
                            save(Ivent(title: title, items: items))
                        } catch {
                            let error = error as? InputError ?? InputError.unknown
                            self.message = error.title
                            self.showAlert(message: self.message)
                        }
                    }
                }
            }
            .navigationTitle("新規作成")
            .navigationBarTitleDisplayMode(.inline)
        }
        .alert("アイテム追加", isPresented: $isInputItem) {
            TextField("アイテム名", text: $newItem)
            Button(action: {
                self.isInputItem = false
            }) {
                Text("キャンセル")
            }
            
            Button(action: {
                do {
                    try checkItem()
                    addItems()
                    self.isInputItem = false
                    self.newItem = ""
                } catch {
                    let error = error as? InputError ?? InputError.unknown
                    self.message = error.title
                    showAlert(message: message)
                }
            }) {
                Text("確定")
            }
        }
        .alert(message, isPresented: $isAlert, actions: {})
    }
    private func addItems() {
        self.items.append(Item(name: newItem))
    }
    private func check() throws {
        if self.title == "" {
            throw InputError.emptyTitle
        }
        if self.items.isEmpty {
            throw InputError.emptyItem
        }
    }
    private func checkItem() throws {
        if self.newItem == "" {
            throw InputError.emptyItem
        }
    }
    private func showAlert(message: String) {
        self.message = message
        isAlert = true
    }
}

#Preview {
    InputView(save: { _ in }, cancel: {})
}
