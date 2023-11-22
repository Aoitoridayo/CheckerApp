//
//  RewardScreen.swift
//  CheckerApp
//
//  Created by 渡邊魁優 on 2023/11/21.
//

import SwiftUI

struct RewardScreen: View {
    var body: some View {
        NavigationStack {
            LottieView(name: "RewardScreen")
                .navigationTitle("いってらっしゃい！")
        }
    }
}

#Preview {
    RewardScreen()
}
