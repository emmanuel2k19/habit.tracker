//
//  ViewController.swift
//  habit tracker
//
//  Created by Emmanuel Pena on 4/29/25.
//

import UIKit

class ViewController: UIViewController {

    let backgroundView = UIView()
    let label = UILabel()
    let openCalendarButton = UIButton(type: .system)

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backgroundView.frame = view.bounds
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        setUpView()
        applyConstraints()
    }

    func setUpView() {
        // Background
        backgroundView.backgroundColor = .systemBlue
        backgroundView.translatesAutoresizingMaskIntoConstraints = true
        view.addSubview(backgroundView)

        // Title Label
        label.text = "Habit Tracker"
        label.textColor = .systemYellow
        label.font = .boldSystemFont(ofSize: 44)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)

        // Calendar Button
        openCalendarButton.setTitle("Open Calendar", for: .normal)
        openCalendarButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        openCalendarButton.setTitleColor(.white, for: .normal)
        openCalendarButton.backgroundColor = .systemGreen
        openCalendarButton.layer.cornerRadius = 12
        openCalendarButton.translatesAutoresizingMaskIntoConstraints = false
        openCalendarButton.addTarget(self, action: #selector(openCalendarTapped), for: .touchUpInside)
        view.addSubview(openCalendarButton)
    }

    func applyConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            openCalendarButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 40),
            openCalendarButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openCalendarButton.widthAnchor.constraint(equalToConstant: 180),
            openCalendarButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc func openCalendarTapped() {
        let calendarVC = CalendarViewController()
        navigationController?.pushViewController(calendarVC, animated: true)
    }
}
