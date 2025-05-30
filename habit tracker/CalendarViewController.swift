//
//  CalendarViewController.swift
//  habit tracker
//
//  Created by Kevin Flores on 5/30/25.
//

import Foundation
import UIKit

class CalendarViewController: UIViewController {
    
    private let calendarPicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .inline // <- This gives the calendar style
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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        setupViews()
        setupConstraints()

        calendarPicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        updateDateLabel(with: calendarPicker.date)
    }

    private func setupViews() {
        view.addSubview(calendarPicker)
        view.addSubview(selectedDateLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            calendarPicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            calendarPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calendarPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            selectedDateLabel.topAnchor.constraint(equalTo: calendarPicker.bottomAnchor, constant: 20),
            selectedDateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc private func dateChanged() {
        updateDateLabel(with: calendarPicker.date)
    }

    private func updateDateLabel(with date: Date) {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        selectedDateLabel.text = "Selected: \(formatter.string(from: date))"
    }
}
