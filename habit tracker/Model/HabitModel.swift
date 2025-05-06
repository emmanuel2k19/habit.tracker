//
//  HabitModel.swift
//  habit tracker
//
//  Created by Emmanuel Pena on 5/6/25.
//
import Foundation

struct Habit: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var creationDate: Date
    var completions: [Date]
    var goalPerWeek: Int
    var goalPerMonth: Int
    
    init(name: String, goalPerWeek: Int = 3, goalPerMonth: Int = 12) {
        self.id = UUID()
        self.name = name
        self.creationDate = Date()
        self.completions = []
        self.goalPerWeek = goalPerWeek
        self.goalPerMonth = goalPerMonth
    }
    
    mutating func markCompleted(on date: Date = Date()) {
        if !completions.contains(where: { Calendar.current.isDate($0, inSameDayAs: date) }) {
            completions.append(date)
        }
    }
    
    func completions(for date: Date) -> Int {
        let calendar = Calendar.current
        return completions.filter { calendar.isDate($0, inSameDayAs: date) }.count
    }
    
    func completionsThisWeek() -> Int {
        let calendar = Calendar.current
        guard let weekStart = calendar.dateInterval(of: .weekOfYear, for: Date())?.start else { return 0 }
        return completions.filter { $0 >= weekStart }.count
    }
    
    func completionsThisMonth() -> Int {
        let calendar = Calendar.current
        guard let monthStart = calendar.dateInterval(of: .month, for: Date())?.start else { return 0 }
        return completions.filter { $0 >= monthStart }.count
    }
    
    func progressPercentThisWeek() -> Double {
        let completed = Double(completionsThisWeek())
        return min((completed / Double(goalPerWeek)) * 100, 100)
    }
    
    func dataPointsForChart(pastDays: Int = 7) -> [Double] {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        var points: [Double] = []
        
        for dayOffset in (0..<pastDays).reversed() {
            let date = calendar.date(byAdding: .day, value: -dayOffset, to: today)!
            let count = completions.filter { calendar.isDate($0, inSameDayAs: date) }.count
            points.append(Double(count))
        }
        return points
    }
    
}
