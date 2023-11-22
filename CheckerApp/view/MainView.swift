//
//  ContentView.swift
//  CheckerApp
//
//  Created by 渡邊魁優 on 2023/11/21.
//

import SwiftUI

struct MainView: View {
    
    enum Tabs: String, CaseIterable, Identifiable {
        case create = "イベント作成"
        case execution = "イベント実行"
        case setting = "設定"
        
        var id: Self { self }
    }
    
    @EnvironmentObject var iventData: IventData
    @State private var navigationTitle: String = Tabs.execution.rawValue
    @State private var selectionTab: Tabs = .execution
    @State var isFirst = false
    
    var body: some View {
        NavigationStack {
            if isFirst {
                TabView(selection: $selectionTab) {
                    ExecutionView()
                        .tabItem({
                            VStack {
                                Image(systemName: "play.circle")
                                Text("実行")
                            }
                        })
                        .tag(Tabs.execution)
                    
                    CreateIventView()
                        .tabItem({
                            Image(systemName: "note.text")
                            Text("作成")
                        })
                        .tag(Tabs.create)
                    
                    SettingView()
                        .tabItem({
                            VStack {
                                Image(systemName: "gearshape")
                                Text("設定")
                            }
                        })
                        .tag(Tabs.setting)
                }
                .navigationTitle(navigationTitle)
                .navigationBarTitleDisplayMode(.inline)
                .onChange(of: selectionTab, {
                    navigationTitle = selectionTab.rawValue
                })
            } else {
                LottieView(name: "LaunchScreen")
            }
        }
        .onAppear(perform: {
            iventData.onAppear()
        })
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                withAnimation {
                    self.isFirst = true
                }
            }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(IventData())
}
