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
        backgroundView.backgroundColor = .systemBlue
        backgroundView.translatesAutoresizingMaskIntoConstraints = true
        
        label.text = "Habit Tracker "
        label.textColor = .systemYellow
        label.font = .boldSystemFont(ofSize: 44)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(backgroundView)
        view.addSubview(label)
    }
    
    func applyConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
