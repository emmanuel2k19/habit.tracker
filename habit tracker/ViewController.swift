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
        view.backgroundColor = .yellow

                let label = UILabel()
                label.text = "Habit Tracker "
        label.textColor = .blue
                label.font = .boldSystemFont(ofSize: 24)
                label.translatesAutoresizingMaskIntoConstraints = false

                view.addSubview(label)
                NSLayoutConstraint.activate([
                    label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
                ])
        }


}

