//
//  TransactionCellView.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 13.06.2024.
//

import SwiftUI

struct TransactionCellView: View {
    
    var transaction: Transaction
    
    var body: some View {
        VStack {
            HStack {
                Text(transaction.category!.name)
                Spacer()
                VStack {
                    Text(transaction.note)
                    Text(transaction.account!.name)
                }
                Spacer()
                Text("\(String(format: "%.2f", transaction.amount))")
                    .fontWeight(.semibold)
                    .font(.system(size: 26))
                    .foregroundStyle(transaction.transactionType == "income" ? .green : .red)
            }
            Text(transaction.desc)
        }
    }
}

#Preview {
    TransactionCellView(transaction: Transaction(date: Date.now, amount: 10.0, transactionType: "expense", note: "title", desc: "description"))
}
