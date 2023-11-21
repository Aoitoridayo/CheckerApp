//
//  ExecutionListRow.swift
//  CheckerApp
//
//  Created by 渡邊魁優 on 2023/11/21.
//

import SwiftUI

struct ExecutionListRow: View {
    @State var ivent: Ivent
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
    }
}

#Preview {
    ExecutionListRow(ivent: Ivent(title: "バイト", items: [
        Item(name: "制服"),
        Item(name: "免許証")
    ]))
}
