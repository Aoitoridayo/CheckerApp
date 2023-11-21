//
//  ExecutionListRow.swift
//  CheckerApp
//
//  Created by 渡邊魁優 on 2023/11/21.
//

import SwiftUI

struct ExecutionListRow: View {
    @State var ivent: Ivent
    @State private var isExecuit = false
    let active: () -> Void
    var body: some View {
        HStack {
            Spacer()
            HStack {
                Text(ivent.title)
                    .font(.title3)
                    .padding()
                Spacer()
                VStack {
                    Button(action: {
                        active()
                        isExecuit = true
                    }) {
                        VStack {
                            Image(systemName: "play.rectangle")
                                .imageScale(.large)
                            Text("実行する")
                        }
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
            }
            Spacer()
        }
        .sheet(isPresented: $isExecuit) {
            ActiveView(items: ivent.items)
        }
    }
}

struct Preview: View {
    @State var bool = false
    var body: some View {
        ExecutionListRow(ivent: Ivent(title: "バイト", items: [
            Item(name: "制服"),
            Item(name: "免許証")
        ]), active: {})
    }
}

#Preview {
    Preview()
}
