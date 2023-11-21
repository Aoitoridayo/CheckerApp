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
                List(iventData.ivents) { ivent in
                    CreateListRow(ivent: ivent)
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button(role: .destructive) {
                                withAnimation {
                                    iventData.didTapIventDeleteButton(ivent: ivent)
                                }
                            } label: {
                                Image(systemName: "trash")
                            }
                            .tint(.red)
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
