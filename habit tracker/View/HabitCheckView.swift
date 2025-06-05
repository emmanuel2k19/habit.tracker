//
//  HabitChackView.swift
//  habit tracker
//
//  Created by Emmanuel Pena on 5/6/25.
//
import UIKit

class HabitCheckView: UIView {

     let checkbox = UIButton(type: .system)
     let habitLabel = UILabel()
     var isChecked = false

    var habitText: String {
        return habitLabel.text ?? ""
    }
    
    init(habitText: String) {
        super.init(frame: .zero)
        setupUI(habitText: habitText)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI(habitText: String) {
        checkbox.setImage(UIImage(systemName: "circle"), for: .normal)
        checkbox.tintColor = .systemGray
        checkbox.addTarget(self, action: #selector(toggleCheckmark), for: .touchUpInside)

        habitLabel.text = habitText
        habitLabel.font = .systemFont(ofSize: 16)

        let stack = UIStackView(arrangedSubviews: [checkbox, habitLabel])
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center

        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            checkbox.widthAnchor.constraint(equalToConstant: 24),
            checkbox.heightAnchor.constraint(equalToConstant: 24)
        ])
    }

    @objc private func toggleCheckmark() {
        isChecked.toggle()
        let imageName = isChecked ? "checkmark.circle.fill" : "circle"
        checkbox.setImage(UIImage(systemName: imageName), for: .normal)
        checkbox.tintColor = isChecked ? .systemGreen : .systemGray
    }
}

