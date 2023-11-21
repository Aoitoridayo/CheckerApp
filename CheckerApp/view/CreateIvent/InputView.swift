//
//  InputView.swift
//  CheckerApp
//
//  Created by 渡邊魁優 on 2023/11/21.
//

import SwiftUI

struct InputView: View {
    @State private var isInputItem = false
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
                    Button(action: {
                        self.isInputItem = true
                    }) {
                        Image(systemName: "plus.circle")
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
                        save(Ivent(title: title, items: items))
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
                addItems()
                self.isInputItem = false
                self.newItem = ""
            }) {
                Text("確定")
            }
        }
    }
    
    private func addItems() {
        self.items.append(Item(name: newItem))
    }
}

#Preview {
    InputView(save: { _ in }, cancel: {})
}
