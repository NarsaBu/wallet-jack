//
//  CalendarView.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 13.06.2024.
//

import SwiftUI
import SwiftData

struct CalendarView: View {
    
    @State private var selectedDate: Date = .init()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            DatePicker("Дата", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(.graphical)
            ScrollView(.vertical) {
                VStack {
                    CalendarTransactionItemView(date: Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: selectedDate)!)
                }
                .hSpacing(.center)
                .vSpacing(.center)
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    CalendarView()
}
