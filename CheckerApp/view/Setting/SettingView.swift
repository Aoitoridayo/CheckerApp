//
//  SettingView.swift
//  CheckerApp
//
//  Created by 渡邊魁優 on 2023/11/21.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        List {
            Section("評価") {
                Button(action: {
                    
                }) {
                    Text("アプリをシェア")
                }
            }
            Section("情報") {
                Text("利用規約")
                HStack {
                    Text("バージョン")
                    Spacer()
                    Text("1.0")
                }
            }
            Text("データを削除")
                .foregroundStyle(Color.red)
        }
    }
}

#Preview {
    SettingView()
}
