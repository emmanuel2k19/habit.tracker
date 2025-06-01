//
//  createAccountView.swift
//  habit tracker
//
//  Created by Emmanuel Pena on 5/31/25.
//
import UIKit

class CreateAccountViewController: UIViewController {
    
    let nameField = UITextField()
    let emailField = UITextField()
    let passwordField = UITextField()
    let confirmPasswordField = UITextField()
    let createAccountButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Create Account"
        setupUI()
        applyConstraints()
    }
    
    func setupUI() {
        // Name
        nameField.placeholder = "Name"
        nameField.borderStyle = .roundedRect
        nameField.autocapitalizationType = .words
        nameField.translatesAutoresizingMaskIntoConstraints = false
        
        // Email
        emailField.placeholder = "Email"
        emailField.borderStyle = .roundedRect
        emailField.autocapitalizationType = .none
        emailField.keyboardType = .emailAddress
        emailField.translatesAutoresizingMaskIntoConstraints = false
        
        // Password
        passwordField.placeholder = "Password"
        passwordField.borderStyle = .roundedRect
        passwordField.isSecureTextEntry = true
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        
        // Confirm Password
        confirmPasswordField.placeholder = "Confirm Password"
        confirmPasswordField.borderStyle = .roundedRect
        confirmPasswordField.isSecureTextEntry = true
        confirmPasswordField.translatesAutoresizingMaskIntoConstraints = false
        
        // Button
        createAccountButton.setTitle("Create Account", for: .normal)
        createAccountButton.setTitleColor(.white, for: .normal)
        createAccountButton.backgroundColor = .systemTeal
        createAccountButton.layer.cornerRadius = 10
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        createAccountButton.addTarget(self, action: #selector(createAccountTapped), for: .touchUpInside)
        
        // Add to view
        view.addSubview(nameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(confirmPasswordField)
        view.addSubview(createAccountButton)
    }
    
    func applyConstraints() {
        NSLayoutConstraint.activate([
            nameField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nameField.heightAnchor.constraint(equalToConstant: 44),
            
            emailField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 20),
            emailField.leadingAnchor.constraint(equalTo: nameField.leadingAnchor),
            emailField.trailingAnchor.constraint(equalTo: nameField.trailingAnchor),
            emailField.heightAnchor.constraint(equalToConstant: 44),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
            passwordField.leadingAnchor.constraint(equalTo: nameField.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: nameField.trailingAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 44),
            
            confirmPasswordField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20),
            confirmPasswordField.leadingAnchor.constraint(equalTo: nameField.leadingAnchor),
            confirmPasswordField.trailingAnchor.constraint(equalTo: nameField.trailingAnchor),
            confirmPasswordField.heightAnchor.constraint(equalToConstant: 44),
            
            createAccountButton.topAnchor.constraint(equalTo: confirmPasswordField.bottomAnchor, constant: 40),
            createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createAccountButton.widthAnchor.constraint(equalToConstant: 200),
            createAccountButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func createAccountTapped() {
        print("Account created for: \(nameField.text ?? "")")
        navigationController?.popViewController(animated: true)
    }
}
