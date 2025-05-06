//
//  AddHabitView.swift
//  habit tracker
//
//  Created by Emmanuel Pena on 5/2/25.
//
import UIKit

protocol AddHabitDelegate: AnyObject {
    func didAddHabit(_ habit: String)
}

class AddHabitViewController: UIViewController {
    
    let viewModel = HabitViewModel()
    weak var delegate: AddHabitDelegate?
    
    let habitNameTextField = UITextField()
    let repeatButton = UIButton(type: .system)
    let remindersButton = UIButton(type: .system)
    let addHabitButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        title = "New Habit"
   
        addHabitButton.addTarget(self, action: #selector(addHabitTapped), for: .touchUpInside)
        setupUI()
    }
    
    func setupUI() {
        // Habit Name Label
        let habitNameLabel = UILabel()
        habitNameLabel.text = "Habit Name"
        habitNameLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        // Habit Name TextField
        habitNameTextField.placeholder = "e.g. Study Spanish"
        habitNameTextField.borderStyle = .roundedRect
        
        // Repeat Label
        let repeatLabel = UILabel()
        repeatLabel.text = "Repeat"
        repeatLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        // Repeat Button
        repeatButton.setTitle("Every day >", for: .normal)
        repeatButton.contentHorizontalAlignment = .left
        
        // Reminders Button
        remindersButton.setTitle("Reminders >", for: .normal)
        remindersButton.contentHorizontalAlignment = .left
        
        // Add Habit Button
        addHabitButton.setTitle("Add Habit", for: .normal)
        addHabitButton.setTitleColor(.white, for: .normal)
        addHabitButton.backgroundColor = UIColor.systemTeal
        addHabitButton.layer.cornerRadius = 10
        addHabitButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // StackView
        let stack = UIStackView(arrangedSubviews: [
            habitNameLabel, habitNameTextField,
            repeatLabel, repeatButton,
            remindersButton,
            addHabitButton
        ])
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
    }
    
    @objc func addHabitTapped() {
        let habitName = habitNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
                
                guard !habitName.isEmpty else {
                    // Optional: Show alert for empty input
                    return
                }
                
                delegate?.didAddHabit(habitName)
                navigationController?.popViewController(animated: true)
    }
    
}

