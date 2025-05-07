//
//  DahsboardViewController.swift
//  habit tracker
//
//  Created by Emmanuel Pena on 5/1/25.
//
import UIKit

class DashboardController: UIViewController,AddHabitDelegate {
    
    let viewModel = HabitViewModel()
    var habits:[String] = []
    var habitsLabel = UILabel()
    
    func didAddHabit(_ habit: String) {
        viewModel.addHabit(name: habit)
    }
    
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    let progressView = ProgressCardView()
    let addHabitButton = UIButton(type: .system)
    let habitsContainer = UIView()
    let habitsHeader = UILabel()
    let habitsStack = UIStackView()
    
    let dummyHabits = ["Read for 20 minutes", "Walk the dog", "Exercise", "Meditate"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        setupUI()
        applyConstraints()
        viewModel.onHabitsChanged = { [weak self] in
            self?.reloadHabitsUI()
        }
        
    }
    func reloadHabitsUI() {
        // Clear existing views
        habitsStack.arrangedSubviews.forEach { $0.removeFromSuperview() }

        // Add updated habits from viewModel
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
        view.addSubview(progressView)
        
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
        
    }
    
    func applyConstraints() {
        [titleLabel, dateLabel, progressView, habitsContainer, habitsHeader, habitsStack, addHabitButton, habitsLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            progressView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            progressView.heightAnchor.constraint(equalToConstant: 180),
            
            habitsContainer.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 20),
            habitsContainer.leadingAnchor.constraint(equalTo: progressView.leadingAnchor),
            habitsContainer.trailingAnchor.constraint(equalTo: progressView.trailingAnchor),
            
            habitsHeader.topAnchor.constraint(equalTo: habitsContainer.topAnchor, constant: 16),
            habitsHeader.leadingAnchor.constraint(equalTo: habitsContainer.leadingAnchor, constant: 16),
            
            habitsStack.topAnchor.constraint(equalTo: habitsHeader.bottomAnchor, constant: 12),
            habitsStack.leadingAnchor.constraint(equalTo: habitsHeader.leadingAnchor),
            habitsStack.trailingAnchor.constraint(equalTo: habitsContainer.trailingAnchor, constant: -16),
            habitsStack.bottomAnchor.constraint(equalTo: habitsContainer.bottomAnchor, constant: -16),
            
            addHabitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addHabitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            addHabitButton.heightAnchor.constraint(equalToConstant: 50),
            addHabitButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    @objc func addHabitTapped() {
        let addVC = AddHabitViewController()
        addVC.delegate = self
        navigationController?.pushViewController(addVC, animated: true)
    }
    
    @objc func historyButtonTapped() {
        let historyVC = HistoryViewController()
        navigationController?.pushViewController(historyVC, animated: true)
    }
    
    
}
 
