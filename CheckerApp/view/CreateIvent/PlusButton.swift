//
//  PlusButton.swift
//  CheckerApp
//
//  Created by 渡邊魁優 on 2023/11/21.
//

import SwiftUI

struct PlusButton: View {
    let active: () -> Void
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    active()
                }) {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 40))
                }
                .frame(width: 70, height: 70)
                .padding()
            }
        }
    }
}

#Preview {
    PlusButton(active: {})
}
