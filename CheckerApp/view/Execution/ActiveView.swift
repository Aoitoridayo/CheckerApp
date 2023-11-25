//
//  ActiveView.swift
//  CheckerApp
//
//  Created by 渡邊魁優 on 2023/11/21.
//

import SwiftUI

struct ActiveView: View {
    @State var items: [Item]
    
    @State private var isAlert = false
    @State private var isGood = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($items) { item in
                    ActiveListRow(item: item)
                }
                Button(action: {
                    self.checkItem()
                }) {
                    HStack {
                        Spacer()
                        Text("準備完了")
                        Spacer()
                    }
                }
            }
            .navigationDestination(isPresented: $isGood, destination: {
                RewardScreen()
            })
        }
        .alert("エラー", isPresented: $isAlert) {
            Button("確認") {
                        isAlert = false
                    }
                } message: {
                    Text("確認してない項目があります")
                }
    }
    private func checkItem() {
        for item in items {
            if item.isCheck == false {
                isAlert = true
                return
            }
        }
        isGood = true
    }
}

#Preview {
    ActiveView(items: [
        Item(name: "免許証"),
        Item(name: "筆記用具")
    ])
}
