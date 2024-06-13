//
//  CalendarTransactionCellView.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 13.06.2024.
//

import SwiftUI

struct CalendarTransactionCellView: View {
    
    @Bindable var transaction: Transaction
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            Circle()
                .fill(.black)
                .frame(width: 10, height: 10)
                .padding(4)
                .background(.white.shadow(.drop(color: .black.opacity(0.1), radius: 3)), in: .circle)
                .overlay {
                    Circle()
                        .frame(width: 50, height: 50)
                        .blendMode(.destinationOver)                }
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(transaction.note)
                        .font(.system(size: 20, weight: .semibold))
                    Spacer()
                    Text("\(String(format: "%.2f", transaction.amount))")
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                        .foregroundStyle(transaction.transactionType == "income" ? .green : .red)
                }
                .hSpacing(.leading)
                
                Text(transaction.transactionType)
                    .font(.callout)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .clipShape(.rect(cornerRadius: 20))
        }
        .padding(.horizontal)
    }
}

#Preview {
    CalendarTransactionCellView(transaction: Transaction(date: Date.now, amount: 10.0, transactionType: "income", note: "title", desc: "desc"))
}
