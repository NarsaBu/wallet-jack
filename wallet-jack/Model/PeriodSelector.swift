//
//  PeriodSelector.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 22.05.2024.
//

import Foundation

enum PeriodSelector: String, CaseIterable, Identifiable {
    
    var id : PeriodSelector {
        self
    }
    
    case DAILY = "daily"
    case CALENDAR = "calendar"
    case SUMMARY = "summary"
}
