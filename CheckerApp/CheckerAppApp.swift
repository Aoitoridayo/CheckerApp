//
//  CheckerAppApp.swift
//  CheckerApp
//
//  Created by 渡邊魁優 on 2023/11/21.
//

import SwiftUI

@main
struct CheckerAppApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(IventData())
        }
    }
}
