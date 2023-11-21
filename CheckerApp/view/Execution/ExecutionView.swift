//
//  ExecutionView.swift
//  CheckerApp
//
//  Created by 渡邊魁優 on 2023/11/21.
//

import SwiftUI

struct ExecutionView: View {
    @EnvironmentObject var iventData: IventData
    var body: some View {
        if iventData.ivents.isEmpty {
            Image("ExecutionBackGround.001")
                .resizable()
                .scaledToFit()
        } else {
            List {
                ForEach(iventData.ivents) { ivent in
                    ExecutionListRow(ivent: ivent, active: {
                        iventData.didTapExecutionButton()
                    })
                }
            }
            .listStyle(InsetListStyle())
        }
    }
}

#Preview {
    ExecutionView()
        .environmentObject(IventData())
}
