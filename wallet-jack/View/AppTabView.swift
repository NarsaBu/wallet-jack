//
//  AppTabView.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 20.05.2024.
//

import SwiftUI

struct AppTabView: View {
    
    var body: some View {
        TabView {
            TransactionView()
                .tabItem {
                    Image(systemName: "list.bullet.rectangle")
                    Text("\(Date().getCurrentMonth())/\(Date().getCurrentDay())")
                }
            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
            StatisticView()
                .tabItem {
                    Image(systemName: "chart.bar.xaxis")
                    Text("Stats")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "creditcard")
                    Text("Accounts")
                }
            CategoriesView()
                .tabItem {
                    Image(systemName: "folder.fill")
                    Text("Categories")
                }
        }
    }
}

#Preview {
    AppTabView()
}
