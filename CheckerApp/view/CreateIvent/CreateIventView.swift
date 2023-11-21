//
//  CreateIventView.swift
//  CheckerApp
//
//  Created by 渡邊魁優 on 2023/11/21.
//

import SwiftUI

struct CreateIventView: View {
    @EnvironmentObject var iventData: IventData
    var body: some View {
            ZStack {
                if iventData.ivents.isEmpty {
                    Image("CreateBackGround.001")
                        .resizable()
                        .scaledToFit()
                }
                else {
                    List {
                        ForEach(iventData.ivents) { ivent in
                            Text(ivent.title)
                        }
                    }
                    .listStyle(InsetListStyle())
                }
                PlusButton(active: {
                    iventData.didTapIventPlusButton()
                })
            }
            .sheet(isPresented: $iventData.isCreateIventView, content: {
                InputView(
                    save: { ivent in
                    iventData.didTapSaveButton(ivent: ivent)
                },
                    cancel: {
                    iventData.didTapCancelButton()
                })
        })
    }
}

#Preview {
    CreateIventView()
        .environmentObject(IventData())
}
