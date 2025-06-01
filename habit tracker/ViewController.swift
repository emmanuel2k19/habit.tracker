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
    let getStarted = UIButton()
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backgroundView.frame = view.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpView()
        applyConstraints()
    }
    
    func setUpView() {
        backgroundView.backgroundColor = .white
        backgroundView.translatesAutoresizingMaskIntoConstraints = true
        
        label.text = "Habit Tracker "
        label.textColor = .systemTeal
        label.font = .boldSystemFont(ofSize: 44)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        getStarted.setTitle("Get Started", for: .normal)
        getStarted.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        getStarted.layer.cornerRadius = 10
        getStarted.backgroundColor = .systemTeal
        getStarted.setTitleColor(.white, for: .normal)
        getStarted.translatesAutoresizingMaskIntoConstraints = false
        getStarted.addTarget(self, action: #selector(didTapGetStarted), for: .touchUpInside)
        
        view.addSubview(backgroundView)
        view.addSubview(label)
        view.addSubview(getStarted)
    }
    
    func applyConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            getStarted.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant :10),
            getStarted.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getStarted.widthAnchor.constraint(equalToConstant: 200),
            getStarted.heightAnchor.constraint(equalToConstant: 50),
            
            
        ])
    }
    
    @objc func didTapGetStarted() {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    } 
    
    
}

