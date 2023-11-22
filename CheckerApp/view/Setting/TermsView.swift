//
//  TermsView.swift
//  CheckerApp
//
//  Created by 渡邊魁優 on 2023/11/22.
//

import SwiftUI

struct Title: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .padding(.leading, 20)
                .opacity(0.8)
            Spacer()
        }
    }
}

struct Detail: View {
    let detail: String
    var body: some View {
        Text(detail)
            .padding(.horizontal)
            .opacity(0.7)
    }
}

struct TermsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 40) {
                    VStack(spacing: 10) {
                        Title(title: "法例遵守")
                        Detail(detail: "本サービスのご使用によって、本規約に同意していただいたものとみなします。本サービスを利用する前に、必ず本規約をお読みください。")
                    }
                    
                    VStack(spacing: 10) {
                        Title(title: "免責事項")
                        Detail(detail: "本サービスで提供する情報は、その正確性、信頼性、完全性を保証するものではありません。\nサービス提供者は、本サービスの利用に関して利用者が被った損害につき、賠償する責任を一切負わないものとします。\n利用者は、自己の責任において当サービスを利用するものとし、当サービスの利用における一切の損害につき、サービス提供者を免責するものとします。\nサービス提供者は、いかなる場合にも有料にて提供されるサービス等で受領した利用料金の返金には応じません")
                    }
                    
                    VStack(spacing: 10) {
                        Title(title: "サービスの変更・一時停止・終了")
                        Detail(detail: "利用目的その他本プライバシーポリシーの内容を事前の予告なく変更することがあります｡\nサービス提供者は、本サービスの一部または全部を、利用者へ事前に通知することなく、いつでも任意の理由で変更・一時停止・終了することができるものとします。")
                    }
                    VStack(spacing: 10) {
                        Title(title: "プライバシーポリシー")
                        VStack {
                            Detail(detail: "(1)個人情報の利用目的\nお客様の氏名、住所、電話番号、メールアドレス等の個人情報をご提供いただく場合があります｡\n法令により例外として取り扱うことが認められている場合を除き、ご提供いただいた個人情報を、以下の目的で利用するものとします｡\n･利用者に対しサービスを提供するため\n･必要な場合にお客様に連絡をするため\n･商品やアプリなどに関する情報の提供や広告、キャンペーン等の案内のため\n･アプリの改善や新アプリの開発等に利用するため\n･サービス品質向上のためGoogle Analyticsを利用しており「Cookie」を通じて分析を行うことがあります。IPアドレス等のユーザー情報の一部が、Google, Inc.に収集される可能性があります。サイト利用の状況分析、サイト運営者へのレポート作成、その他サービスの提供目的にこれを使用します。利用者は、当社のウェブサイト及びアプリのコンテンツを利用することで、上記方法および目的においてGoogleが行うこうしたデータ処理につき許可を与えたものとみなします。")
                                .padding(.vertical, 20)
                            Detail(detail: "(2)利用者情報の送信停止・削除\n本サービスは、利用者情報の自動送信を停止する手段を提供しておりません。利用者情報の自動送信を停止したい場合は、本サービスをアンインストールしてください。 また、本サービスおよび本サービスは、利用者情報をサービス提供者のサーバから削除する手段を提供しておりません。")
                        }
                    }
                    VStack(spacing: 10) {
                        Title(title: "お問い合わせ")
                        Detail(detail: "Email : aoitoridayo1110@gmail.com")
                    }
                }
                .navigationTitle("利用規約")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    TermsView()
}
