//
//  AccountView.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 22.05.2024.
//

import SwiftUI
import SwiftData

struct AccountView: View {
    
    @State private var isShowingAccountSheet = false
    @State private var isShowingPlusNavigationLink = false
    
    @Query var accounts: [Account]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(accounts) { account in
                    AccountCellView(account: account)
                }
            }
            .navigationTitle("Accounts")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $isShowingAccountSheet) { AddNewAccountView(enableCancelButton: true) }
            .scrollContentBackground(.hidden)
            .overlay { buildOverlay(accounts: accounts) }
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.indigo, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                if isShowingPlusNavigationLink {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: AddNewAccountView(enableCancelButton: false)) {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
    }
    
    private func buildOverlay(accounts: [Account]) -> AnyView? {
        if accounts.isEmpty {
            return AnyView(ContentUnavailableView(label: {
                Label("No Accounts", systemImage: "list.bullet.rectangle.portrait")
            }, description: {
                Text("Start adding accounts to your list.")
            }, actions:  {
                Button("Add Account") {
                    isShowingAccountSheet = true
                    isShowingPlusNavigationLink = true
                }
            })
            .offset(y: -60))
        }
        
        return nil
    }
}

#Preview {
    AccountView()
}
