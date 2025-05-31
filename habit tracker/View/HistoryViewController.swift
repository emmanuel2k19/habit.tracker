//
//  Untitled.swift
//  habit tracker
//
//  Created by Emmanuel Pena on 5/6/25.
import UIKit

class HistoryViewController: UIViewController {
    
    private let calendarPicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .inline
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private let selectedDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .center
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let chartView: LineChartView = {
        let chart = LineChartView()
        chart.translatesAutoresizingMaskIntoConstraints = false
        chart.layer.cornerRadius = 12
        chart.clipsToBounds = true
        chart.backgroundColor = .secondarySystemGroupedBackground
        return chart
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        setupViews()
        setupConstraints()

        calendarPicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        updateDateLabel(with: calendarPicker.date)
        updateChartData()
    }

    private func setupViews() {
        view.addSubview(calendarPicker)
        view.addSubview(selectedDateLabel)
        view.addSubview(chartView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            calendarPicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            calendarPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calendarPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            selectedDateLabel.topAnchor.constraint(equalTo: calendarPicker.bottomAnchor, constant: 20),
            selectedDateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            chartView.topAnchor.constraint(equalTo: selectedDateLabel.bottomAnchor, constant: 30),
            chartView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            chartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            chartView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

    @objc private func dateChanged() {
        updateDateLabel(with: calendarPicker.date)
        updateChartData()
    }

    private func updateDateLabel(with date: Date) {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        selectedDateLabel.text = "Selected: \(formatter.string(from: date))"
    }

    private func updateChartData() {
        // Dummy chart data (e.g., weekly progress)
        let mockData: [CGFloat] = [2, 4, 3, 6, 5, 4, 7]
        chartView.dataPoints = mockData
    }
}
