//
//  AccountCellView.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 22.05.2024.
//

import SwiftUI
import SwiftData

struct AccountCellView: View {
    
    let account: Account
    @Query private var transactions: [Transaction]
    
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
                Text("\u{20BD} \(String(format: "%.2f", countAssets()))")
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
                Text("\u{20BD} -\(String(format: "%.2f", countLiabilities()))")
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
                Text("\u{20BD} \(String(format: "%.2f", countTotal()))")
                    .fontWeight(.semibold)
                    .font(.system(size: 26))
                    .foregroundStyle(.gray)
            }
            .padding(.top)
        }
    }
    
    private func countAssets() -> Double {
        return transactions
            .filter({ $0.account!.id == account.id })
            .filter({ $0.transactionType == "income" })
            .map({ $0.amount })
            .reduce(0, +)
    }
    
    private func countLiabilities() -> Double {
        return transactions
            .filter({ $0.transactionType == "expense" })
            .map({ $0.amount })
            .reduce(0, +)
    }
    
    private func countTotal() -> Double {
        return countAssets() - countLiabilities()
    }
}

#Preview {
    
    AccountCellView(account: Account(name: "account1"))
}
