 //
//  LoginViewController.swift
//  habit tracker
//
//  Created by Emmanuel Pena on 5/1/25.
//
import UIKit

class LoginViewController: UIViewController {
    
    let backgroundView = UIView()
    let emailField = FloatingLabelTextField()
    let passwordField = FloatingLabelTextField()
    let loginButton = UIButton()
    let createAccountButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        applyConstraints()
    }
    
    func setUpView() {
        backgroundView.backgroundColor = .white
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        emailField.placeholder = "Email"
        emailField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordField.placeholder = "Password"
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        
        loginButton.setTitle("Log In", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .systemTeal
        loginButton.layer.cornerRadius = 10
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
        createAccountButton.setTitle("Create Account", for: .normal)
        createAccountButton.setTitleColor(.systemTeal, for: .normal)
        createAccountButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        createAccountButton.addTarget(self, action: #selector(createAccountTapped), for: .touchUpInside)
        
        view.addSubview(backgroundView)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(createAccountButton)
    }
    
    func applyConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            emailField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            emailField.heightAnchor.constraint(equalToConstant: 44),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
            passwordField.leadingAnchor.constraint(equalTo: emailField.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: emailField.trailingAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 44),
            
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 40),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            createAccountButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
    
    @objc func loginTapped() {
        print("Login tapped with email: \(emailField.text ?? "")")
        let dashboardVC = DashboardController()
        navigationController?.pushViewController(dashboardVC, animated: true)
    }
    
    @objc func createAccountTapped() {
        let createAccountVC = CreateAccountViewController()
        navigationController?.pushViewController(createAccountVC, animated: true)
    }
    
    
}
