//
//  HabitModelView.swift
//  habit tracker
//
//  Created by Emmanuel Pena on 5/6/25.
//
import Foundation

class HabitViewModel {
    private(set) var habits: [Habit] = []
    
    var onHabitsChanged: (() -> Void)?

    init() {
        loadHabits()
    }
    
    func addHabit(name: String, weeklyGoal: Int = 3, monthlyGoal: Int = 12) {
        let newHabit = Habit(name: name, goalPerWeek: weeklyGoal, goalPerMonth: monthlyGoal)
        habits.append(newHabit)
        saveHabits()
        onHabitsChanged?()
    }

    func markHabitCompleted(id: UUID, on date: Date = Date()) {
        guard let index = habits.firstIndex(where: { $0.id == id }) else { return }
        habits[index].markCompleted(on: date)
        saveHabits()
        onHabitsChanged?()
    }

    func completionsThisWeek(for id: UUID) -> Int {
        habits.first(where: { $0.id == id })?.completionsThisWeek() ?? 0
    }
    
    func completionsThisMonth(for id: UUID) -> Int {
        habits.first(where: { $0.id == id })?.completionsThisMonth() ?? 0
    }

    func percentThisWeek(for id: UUID) -> Double {
        habits.first(where: { $0.id == id })?.progressPercentThisWeek() ?? 0
    }

    func chartData(for id: UUID) -> [Double] {
        habits.first(where: { $0.id == id })?.dataPointsForChart() ?? []
    }

    // MARK: - Persistence (basic UserDefaults for now)
    
    private func saveHabits() {
        if let data = try? JSONEncoder().encode(habits) {
            UserDefaults.standard.set(data, forKey: "savedHabits")
        }
    }

    private func loadHabits() {
        if let data = UserDefaults.standard.data(forKey: "savedHabits"),
           let decoded = try? JSONDecoder().decode([Habit].self, from: data) {
            habits = decoded
        }
    }
}
