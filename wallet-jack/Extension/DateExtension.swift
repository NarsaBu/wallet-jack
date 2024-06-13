//
//  DateExtension.swift
//  wallet-jack
//
//  Created by Marat Usmanov on 22.05.2024.
//

import Foundation

extension Date {
    
    func getCurrentDay(date: Date = Date.now) -> Int {
        let calendar = Calendar.current
        return calendar.component(.day, from: date)
    }
    
    func getCurrentMonth(date: Date = Date.now) -> Int {
        let calendar = Calendar.current
        return calendar.component(.month, from: date)
    }
    
    func getCurrentMonthEnum() -> Month {
        let currentMonthNumber = getCurrentMonth()
        return Month(rawValue: "\(currentMonthNumber)")!
    }
    
    func getCurrentYear(date: Date = Date.now) -> Int {
        let calendar = Calendar.current
        return calendar.component(.year, from: date)
    }
    
    func compareWith(day2: Int, month2: Int, year2: Int) -> Bool {
        let day1 = getCurrentDay(date: self)
        let month1 = getCurrentMonth(date: self)
        let year1 = getCurrentYear(date: self)
        
        return day1 == day2 && month1 == month2 && year1 == year2
    }
}
