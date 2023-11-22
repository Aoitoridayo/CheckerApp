//
//  SettingView.swift
//  CheckerApp
//
//  Created by 渡邊魁優 on 2023/11/21.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var iventData: IventData
    @State private var isShared = false
    @State private var isAlert = false
    var body: some View {
        List {
            Section("評価") {
                Button(action: {
                    isShared = true
                }) {
                    Text("アプリをシェア")
                }
            }
            Section("情報") {
                NavigationLink("利用規約", destination: TermsView())
                HStack {
                    Text("バージョン")
                    Spacer()
                    Text("1.0")
                }
            }
            Button(action: {
                isAlert = true
            }) {
                Text("データを削除")
                    .foregroundStyle(Color.red)
            }
        }
        .alert("警告",
               isPresented: $isAlert,
               actions: {
            Button(action: {
                isAlert = false
            }) {
                Text("戻る")
            }
            Button(action: {
                iventData.didTapDeleteButton()
            }) {
                Text("確認")
            }
        },
               message: {
            Text("すべてのデータが削除されます")
        })
        .sheet(isPresented: $isShared) {
            ActivityView(activityItems: ["https://github.com/Aoitoridayo/CheckerApp"])
        }
    }
}

#Preview {
    SettingView()
        .environmentObject(IventData())
}
