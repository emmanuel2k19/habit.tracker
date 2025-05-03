//
//  Habitc=CheckboxView.swift
//  habit tracker
//
//  Created by Emmanuel Pena on 5/2/25.
//
import UIKit

class HabitCheckboxView: UIStackView {
    
    private let box = UIView()
    private let label = UILabel()
    
    init(habitText: String) {
        super.init(frame: .zero)
        setupView(habitText: habitText)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(habitText: String) {
        axis = .horizontal
        spacing = 8
        alignment = .center
        
        box.backgroundColor = .systemTeal
        box.layer.cornerRadius = 6
        box.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            box.widthAnchor.constraint(equalToConstant: 20),
            box.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        label.text = habitText
        label.font = .systemFont(ofSize: 16)
        
        addArrangedSubview(box)
        addArrangedSubview(label)
    }
}
