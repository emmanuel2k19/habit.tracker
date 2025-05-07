//
//  ProgressCardView.swift
//  habit tracker
//
//  Created by Emmanuel Pena on 5/2/25.
//
import UIKit

class ProgressCardView: UIView {
    
    let circle = UIView()
    let percentLabel = UILabel()
    let textLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        layer.cornerRadius = 12
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = .zero
        layer.shadowRadius = 5
        
        circle.backgroundColor = UIColor.systemTeal.withAlphaComponent(0.2)
        circle.layer.cornerRadius = 75
        circle.translatesAutoresizingMaskIntoConstraints = false
        
        percentLabel.text = "60%"
        percentLabel.font = .boldSystemFont(ofSize: 28)
        percentLabel.textAlignment = .center
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        textLabel.text = "Progress"
        textLabel.font = .systemFont(ofSize: 14)
        textLabel.textColor = .gray
        textLabel.textAlignment = .center
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(circle)
        addSubview(percentLabel)
        addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            circle.centerXAnchor.constraint(equalTo: centerXAnchor),
            circle.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            circle.widthAnchor.constraint(equalToConstant: 150),
            circle.heightAnchor.constraint(equalToConstant: 150),
            
            percentLabel.centerXAnchor.constraint(equalTo: circle.centerXAnchor),
            percentLabel.centerYAnchor.constraint(equalTo: circle.centerYAnchor, constant: -10),
            
            textLabel.centerXAnchor.constraint(equalTo: percentLabel.centerXAnchor),
            textLabel.topAnchor.constraint(equalTo: percentLabel.bottomAnchor, constant: 4),
        ])
    }
}
