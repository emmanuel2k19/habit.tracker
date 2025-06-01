//
//  FloatingLabelTextFieldView.swift
//  habit tracker
//
//  Created by Emmanuel Pena on 5/31/25.
//
import UIKit

class FloatingLabelTextField: UIView {
    
    // MARK: - UI Elements
    private let textField = UITextField()
    private let floatingLabel = UILabel()
    private let border = UIView()
    
    // MARK: - Configurable Properties
    var placeholder: String? {
        didSet {
            textField.placeholder = placeholder
            floatingLabel.text = placeholder
        }
    }
    
    var text: String? {
        return textField.text
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        addObservers()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setupConstraints()
        addObservers()
    }
    
    // MARK: - Setup
    private func setupViews() {
        self.clipsToBounds = false
        
        // Enable tap-to-focus
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(tap)
        
        // TextField
        textField.borderStyle = .none
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .label
        textField.tintColor = .systemBlue
        textField.backgroundColor = .clear
        self.addSubview(textField)
        
        // Floating Label
        floatingLabel.font = UIFont.systemFont(ofSize: 14)
        floatingLabel.textColor = .systemBlue
        floatingLabel.alpha = 0
        self.addSubview(floatingLabel)
        
        // Border
        border.backgroundColor = .systemGray4
        self.addSubview(border)
    }
    
    private func setupConstraints() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        floatingLabel.translatesAutoresizingMaskIntoConstraints = false
        border.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            floatingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            floatingLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            textField.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            textField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            
            border.heightAnchor.constraint(equalToConstant: 1),
            border.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            border.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            border.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func addObservers() {
        textField.addTarget(self, action: #selector(editingBegan), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(editingEnded), for: .editingDidEnd)
    }
    
    // MARK: - Animation
    @objc private func editingBegan() {
        animateFloatingLabel(up: true)
        border.backgroundColor = .systemBlue
    }
    
    @objc private func editingEnded() {
        if textField.text?.isEmpty ?? true {
            animateFloatingLabel(up: false)
        }
        border.backgroundColor = .systemGray4
    }
    
    private func animateFloatingLabel(up: Bool) {
        UIView.animate(withDuration: 0.2) {
            self.floatingLabel.transform = up ? CGAffineTransform(translationX: 0, y: -18) : .identity
            self.floatingLabel.alpha = up ? 1.0 : 0.0
        }
    }
    
    // MARK: - Public
    func getTextField() -> UITextField {
        return textField
    }
    
    @objc private func handleTap() {
        textField.becomeFirstResponder()
    }
    
}
