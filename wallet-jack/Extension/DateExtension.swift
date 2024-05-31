//
//  DateExtension.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 22.05.2024.
//

import Foundation

extension Date {
    
    func getCurrentDay() -> Int {
        let date = Date.now
        let calendar = Calendar.current
        return calendar.component(.day, from: date)
    }
    
    func getCurrentMonth() -> Int {
        let date = Date.now
        let calendar = Calendar.current
        return calendar.component(.month, from: date)
    }
    
    func getCurrentMonthEnum() -> Month {
        let currentMonthNumber = getCurrentMonth()
        return Month(rawValue: "\(currentMonthNumber)")!
    }
    
    func getCurrentYear() -> Int {
        let date = Date.now
        let calendar = Calendar.current
        return calendar.component(.year, from: date)
    }
}
