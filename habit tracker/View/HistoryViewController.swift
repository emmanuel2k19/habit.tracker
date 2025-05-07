//
//  Untitled.swift
//  habit tracker
//
//  Created by Emmanuel Pena on 5/6/25.
//
import UIKit
import FSCalendar
import Charts

class HistoryViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    
    // UI Elements
    let titleLabel = UILabel()
    let calendar = FSCalendar()
    let completionsLabel = UILabel()
    let chartView = LineChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        setupUI()
        setupConstraints()
        setupChart()
    }
    
    private func setupUI() {
        // Title
        titleLabel.text = "Exercise"
        titleLabel.font = .boldSystemFont(ofSize: 28)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Calendar
        calendar.delegate = self
        calendar.dataSource = self
        calendar.layer.cornerRadius = 12
        calendar.clipsToBounds = true
        calendar.translatesAutoresizingMaskIntoConstraints = false
        
        // Completions Label
        let boldText = "12"
        let fullText = "3 this week     \(boldText) this month"
        let attributed = NSMutableAttributedString(string: fullText)
        if let range = fullText.range(of: boldText) {
            let nsRange = NSRange(range, in: fullText)
            attributed.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 16), range: nsRange)
        }
        completionsLabel.attributedText = attributed
        completionsLabel.font = .systemFont(ofSize: 16)
        completionsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Chart View
        chartView.layer.cornerRadius = 12
        chartView.clipsToBounds = true
        chartView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add subviews
        view.addSubview(titleLabel)
        view.addSubview(calendar)
        view.addSubview(completionsLabel)
        view.addSubview(chartView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            calendar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            calendar.heightAnchor.constraint(equalToConstant: 300),
            
            completionsLabel.topAnchor.constraint(equalTo: calendar.bottomAnchor, constant: 16),
            completionsLabel.leadingAnchor.constraint(equalTo: calendar.leadingAnchor),
            
            chartView.topAnchor.constraint(equalTo: completionsLabel.bottomAnchor, constant: 12),
            chartView.leadingAnchor.constraint(equalTo: calendar.leadingAnchor),
            chartView.trailingAnchor.constraint(equalTo: calendar.trailingAnchor),
            chartView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setupChart() {
        let dataPoints = [2, 4, 3, 6, 4, 5, 7]
        let entries = dataPoints.enumerated().map { ChartDataEntry(x: Double($0.offset), y: Double($0.element)) }
        
        let dataSet = LineChartDataSet(entries: entries, label: nil)
        dataSet.mode = .cubicBezier
        dataSet.drawFilledEnabled = true
        dataSet.fillColor = UIColor.systemTeal.withAlphaComponent(0.2)
        dataSet.setColor(.systemTeal)
        dataSet.setCircleColor(.systemTeal)
        dataSet.lineWidth = 2
        dataSet.circleRadius = 3
        dataSet.drawValuesEnabled = false
        
        chartView.data = LineChartData(dataSet: dataSet)
        chartView.legend.enabled = false
        chartView.rightAxis.enabled = false
        chartView.leftAxis.enabled = false
        chartView.xAxis.enabled = false
    }
}
