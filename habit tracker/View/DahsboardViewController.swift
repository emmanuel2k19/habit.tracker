//
//  DahsboardViewController.swift
//  habit tracker
//
//  Created by Emmanuel Pena on 5/1/25.
//
import UIKit

class DashboardController: UIViewController, AddHabitDelegate {
    
    let viewModel = HabitViewModel()
    var habits: [String] = []
    var habitsLabel = UILabel()
    
    func didAddHabit(_ habit: String) {
        viewModel.addHabit(name: habit)
        updateProgress(to: 0.8) // Example update after adding habit
    }
    
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    let progressView = UIView()
    let addHabitButton = UIButton(type: .system)
    let habitsContainer = UIView()
    let habitsHeader = UILabel()
    let habitsStack = UIStackView()
    let historyButton = UIButton()
    let removeButton = UIButton()
    let dummyHabits = ["Read for 20 minutes", "Walk the dog", "Exercise", "Meditate"]
    
    // Progress Circle Layers and Labels
    let progressLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    let percentageLabel = UILabel()
    let progressDescriptionLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        setupUI()
        applyConstraints()
        
        viewModel.onHabitsChanged = { [weak self] in
            self?.reloadHabitsUI()
            self?.updateProgress(to: 0.6) // Example progress update
        }
        
        // Initial progress value (for example)
        updateProgress(to: 0.75)
    }
    
    func reloadHabitsUI() {
        habitsStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for habit in viewModel.habits {
            let checkbox = HabitCheckView(habitText: habit.name)
            habitsStack.addArrangedSubview(checkbox)
        }
    }
    
    func setupUI() {
        // Title
        titleLabel.text = "Today"
        titleLabel.font = .boldSystemFont(ofSize: 32)
        view.addSubview(titleLabel)
        
        // Date
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        dateLabel.text = formatter.string(from: Date())
        dateLabel.font = .systemFont(ofSize: 16)
        dateLabel.textColor = .secondaryLabel
        view.addSubview(dateLabel)
        
        // Progress View
        progressView.backgroundColor = .clear
        view.addSubview(progressView)
        
        // Circular Path
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 60, startAngle: -.pi / 2, endAngle: 1.5 * .pi, clockwise: true)
        
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 12
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = .round
        progressView.layer.addSublayer(trackLayer)
        
        progressLayer.path = circularPath.cgPath
        progressLayer.strokeColor = UIColor.systemTeal.cgColor
        progressLayer.lineWidth = 12
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.strokeEnd = 0
        progressView.layer.addSublayer(progressLayer)
        
        // Add percentage label
        percentageLabel.text = "0%"
        percentageLabel.font = .boldSystemFont(ofSize: 32)
        percentageLabel.textColor = .label
        percentageLabel.textAlignment = .center
        progressView.addSubview(percentageLabel)
        
        // Add description label
        progressDescriptionLabel.text = "Progress"
        progressDescriptionLabel.font = .systemFont(ofSize: 16)
        progressDescriptionLabel.textColor = .secondaryLabel
        progressDescriptionLabel.textAlignment = .center
        progressView.addSubview(progressDescriptionLabel)
        
        // Habits Container
        habitsContainer.backgroundColor = .white
        habitsContainer.layer.cornerRadius = 12
        view.addSubview(habitsContainer)
        
        habitsHeader.text = "Habits"
        habitsHeader.font = .boldSystemFont(ofSize: 18)
        habitsContainer.addSubview(habitsHeader)
        
        habitsStack.axis = .vertical
        habitsStack.spacing = 10
        habitsContainer.addSubview(habitsStack)
        
        dummyHabits.forEach { habit in
            let checkbox = HabitCheckView(habitText: habit)
            habitsStack.addArrangedSubview(checkbox)
        }
        
        habitsLabel.numberOfLines = 0
        
        // Add Habit Button
        addHabitButton.setTitle("Add Habit", for: .normal)
        addHabitButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        addHabitButton.backgroundColor = .systemTeal
        addHabitButton.setTitleColor(.white, for: .normal)
        addHabitButton.layer.cornerRadius = 10
        addHabitButton.addTarget(self, action: #selector(addHabitTapped), for: .touchUpInside)
        view.addSubview(addHabitButton)
        
        // History Button
        historyButton.setTitle("History", for: .normal)
        historyButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        historyButton.setTitleColor(.systemTeal, for: .normal)
        historyButton.addTarget(self, action: #selector(historyButtonTapped), for: .touchUpInside)
        view.addSubview(historyButton)
        
        removeButton.setTitle("Remove Habit", for: .normal)
        removeButton.setTitleColor(.white, for: .normal)
        removeButton.backgroundColor = .systemRed
        removeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        removeButton.layer.cornerRadius = 8
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        removeButton.addTarget(self, action: #selector(removeButtonTapped), for: .touchUpInside)
        view.addSubview(removeButton)
    }
    
    func applyConstraints() {
        [titleLabel, dateLabel, progressView, habitsContainer, habitsHeader, habitsStack, addHabitButton, habitsLabel, percentageLabel, progressDescriptionLabel,historyButton,removeButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            progressView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            progressView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressView.widthAnchor.constraint(equalToConstant: 150),
            progressView.heightAnchor.constraint(equalToConstant: 180),
            
            percentageLabel.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            percentageLabel.centerYAnchor.constraint(equalTo: progressView.centerYAnchor, constant: -10),
            
            progressDescriptionLabel.topAnchor.constraint(equalTo: percentageLabel.bottomAnchor, constant: 4),
            progressDescriptionLabel.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            
            habitsContainer.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 20),
            habitsContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            habitsContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            habitsHeader.topAnchor.constraint(equalTo: habitsContainer.topAnchor, constant: 16),
            habitsHeader.leadingAnchor.constraint(equalTo: habitsContainer.leadingAnchor, constant: 16),
            
            habitsStack.topAnchor.constraint(equalTo: habitsHeader.bottomAnchor, constant: 12),
            habitsStack.leadingAnchor.constraint(equalTo: habitsHeader.leadingAnchor),
            habitsStack.trailingAnchor.constraint(equalTo: habitsContainer.trailingAnchor, constant: -16),
            habitsStack.bottomAnchor.constraint(equalTo: habitsContainer.bottomAnchor, constant: -16),
            
            addHabitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addHabitButton.bottomAnchor.constraint(equalTo: historyButton.topAnchor, constant: -12),
            addHabitButton.heightAnchor.constraint(equalToConstant: 50),
            addHabitButton.widthAnchor.constraint(equalToConstant: 150),

            historyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            historyButton.bottomAnchor.constraint(equalTo: removeButton.topAnchor, constant: -12),
            historyButton.heightAnchor.constraint(equalToConstant: 44),
            historyButton.widthAnchor.constraint(equalToConstant: 100),

            removeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            removeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            removeButton.heightAnchor.constraint(equalToConstant: 44),
            removeButton.widthAnchor.constraint(equalToConstant: 150),
        ])
        
        // Position the circular layers
        DispatchQueue.main.async {
            let center = CGPoint(x: self.progressView.bounds.width / 2, y: self.progressView.bounds.height / 2 - 10)
            self.trackLayer.position = center
            self.progressLayer.position = center
        }
    }
    
    @objc func addHabitTapped() {
        let addVC = AddHabitViewController()
        addVC.delegate = self
        navigationController?.pushViewController(addVC, animated: true)
    }
    
    func updateProgress(to percent: CGFloat) {
        progressLayer.strokeEnd = percent
        let intPercent = Int(percent * 100)
        percentageLabel.text = "\(intPercent)%"
    }
    
    
    @objc func historyButtonTapped() {
        let historyVC = HistoryViewController()
        navigationController?.pushViewController(historyVC, animated: true)
    }
    
    @objc private func removeButtonTapped() {
        let alert = UIAlertController(title: "Remove Habit", message: "Are you sure you want to remove this habit?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Remove", style: .destructive, handler: { _ in
            self.removeCheckedHabits()
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
     func removeCheckedHabits() {
        var habitsToRemove: [String] = []

        for case let habitView as HabitCheckView in habitsStack.arrangedSubviews {
            if habitView.isChecked {
                habitsToRemove.append(habitView.habitText)
            }
        }

        // Remove from ViewModel
        for habit in habitsToRemove {
            viewModel.removeHabit(named: habit)
        }

        reloadHabitsUI()
    }
}
 
