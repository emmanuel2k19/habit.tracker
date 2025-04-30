//
//  ViewController.swift
//  habit tracker
//
//  Created by Emmanuel Pena on 4/29/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemCyan
        view.frame = UIScreen.main.bounds
        
                let label = UILabel()
                label.text = "Habit Tracker "
                label.textColor = .systemYellow
                label.font = .boldSystemFont(ofSize: 44)
                label.translatesAutoresizingMaskIntoConstraints = false
                
        
                view.addSubview(label)
                NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                ])
        }


}

