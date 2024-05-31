//
//  AccountCellView.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 22.05.2024.
//

import SwiftUI

struct AccountCellView: View {
    
    let account: Account
    
    var body: some View {
        VStack {
            HStack {
                Text("Account Name")
                    .fontWeight(.light)
                    .font(.system(size: 26))
                Spacer()
                Text(account.name)
                    .foregroundStyle(.orange)
                    .fontWeight(.semibold)
                    .font(.system(size: 26))
            }
            HStack {
                Text("Assets")
                    .fontWeight(.light)
                    .font(.system(size: 26))
                Spacer()
                Text("\u{20BD} \(String(format: "%.2f", account.assets))")
                    .fontWeight(.semibold)
                    .font(.system(size: 26))
                    .foregroundStyle(.green)
            }
            .padding(.top)
            HStack {
                Text("Liabilities")
                    .fontWeight(.light)
                    .font(.system(size: 26))
                Spacer()
                Text("\u{20BD} -\(String(format: "%.2f", account.liabilities))")
                    .fontWeight(.semibold)
                    .font(.system(size: 26))
                    .foregroundStyle(.red)
            }
            .padding(.top)
            HStack {
                Text("Total")
                    .fontWeight(.light)
                    .font(.system(size: 26))
                Spacer()
                Text("\u{20BD} \(String(format: "%.2f", account.total))")
                    .fontWeight(.semibold)
                    .font(.system(size: 26))
                    .foregroundStyle(.gray)
            }
            .padding(.top)
        }
    }
}

#Preview {
    
    AccountCellView(account: Account(name: "account1", assets: 1234.0, liabilities: 234.0, total: 1000.0))
}
