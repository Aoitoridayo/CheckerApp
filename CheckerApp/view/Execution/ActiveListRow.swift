//
//  ActiveListRow.swift
//  CheckerApp
//
//  Created by 渡邊魁優 on 2023/11/21.
//

import SwiftUI

struct ActiveListRow: View {
    @Binding var item: Item
    var body: some View {
        HStack {
            Text(item.name)
            Spacer()
            Button(action: {
                item.isCheck.toggle()
            }) {
                Image(systemName: item.isCheck
                      ? "checkmark.circle"
                      : "circle"
                )
                .font(.title)
            }
        }
    }
}

struct SamplePreview: View {
    @State var item = Item(name: "筆記具")
    
    var body: some View {
        ActiveListRow(item: $item)
    }
}

#Preview {
    SamplePreview()
}
