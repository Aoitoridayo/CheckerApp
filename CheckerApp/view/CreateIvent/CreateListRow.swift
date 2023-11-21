//
//  CreateListRow.swift
//  CheckerApp
//
//  Created by 渡邊魁優 on 2023/11/21.
//

import SwiftUI

struct CreateListRow: View {
    @State var ivent: Ivent
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text(ivent.title)
                    .font(.title2)
                    .padding()
                HStack {
                    HStack {
                        Image(systemName: "circle.fill")
                            .font(.caption2)
                            .foregroundStyle(Color.blue)
                        Text(ivent.items[0].name)
                        Text("など")
                    }
                }
                .padding(.leading)
                .opacity(0.5)
            }
            Spacer()
        }
    }
}

#Preview {
    CreateListRow(ivent: Ivent(title: "学校へ行く", items: [
        Item(name: "学生証"),
        Item(name: "筆記用具")
    ]))
}
