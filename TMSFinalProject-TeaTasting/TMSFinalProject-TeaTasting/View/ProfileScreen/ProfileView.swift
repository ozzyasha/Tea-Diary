//
//  ProfileView.swift
//  TMSFinalProject-TeaTasting
//
//  Created by Наталья Мазур on 27.02.24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    enum Constants {
        static let yellowCircleSide: CGFloat = 300
        static let redCircleSide: CGFloat = 300
        static let littleYellowCircleSide: CGFloat = 170
    }
    
    let yellowCircle: UIView = {
        let circle = UIView()
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
    }()
    
    let redCircle: UIView = {
        let circle = UIView()
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
    }()
    
    let greetingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 30)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let littleYellowCircle: UIView = {
        let circle = UIView()
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
    }()
    
    let buttonsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let teaDiaryButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemGray4.cgColor
        button.setTitle("Мой чайный дневник", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let ordersButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemGray4.cgColor
        button.setTitle("Мои заказы", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let friendsButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemGray4.cgColor
        button.setTitle("Мои друзья", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var avatar = UIImageView(image: UIImage(named: "dog"))
    
    var username = "usernamelong"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCircleViews()
        setupAvatar()
        setupLittleYellowCircle()
        setupGreetingLabel()
        setupStackView()
    }
    
    private func setupCircleViews() {
        makeCircle(yellowCircle, side: Constants.yellowCircleSide, color: .systemYellow)
        makeCircle(redCircle, side: Constants.redCircleSide, color: .systemRed)
        
        view.addSubview(yellowCircle)
        view.addSubview(redCircle)
        
        NSLayoutConstraint.activate([
            yellowCircle.topAnchor.constraint(equalTo: view.topAnchor, constant: -50),
            yellowCircle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -80),
            yellowCircle.widthAnchor.constraint(equalToConstant: Constants.yellowCircleSide),
            yellowCircle.heightAnchor.constraint(equalToConstant: Constants.yellowCircleSide),
            
            redCircle.topAnchor.constraint(equalTo: yellowCircle.topAnchor, constant: -70),
            redCircle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -20),
            redCircle.widthAnchor.constraint(equalToConstant: Constants.redCircleSide),
            redCircle.heightAnchor.constraint(equalToConstant: Constants.redCircleSide)
        ])
        
    }
    
    private func makeCircle(_ circle: UIView, side: CGFloat, color: UIColor) {
        circle.layer.cornerRadius = side / 2
        circle.backgroundColor = color
    }
    
    private func setupAvatar() {
        avatar.layer.cornerRadius = 20
        avatar.layer.masksToBounds = true
        
        view.addSubview(avatar)
        
        avatar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatar.trailingAnchor.constraint(equalTo: redCircle.trailingAnchor, constant: 10),
            avatar.bottomAnchor.constraint(equalTo: yellowCircle.bottomAnchor, constant: 10),
            avatar.widthAnchor.constraint(equalToConstant: 180),
            avatar.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    private func setupLittleYellowCircle() {
        makeCircle(littleYellowCircle, side: Constants.littleYellowCircleSide, color: .systemYellow)
        
        view.addSubview(littleYellowCircle)
        
        NSLayoutConstraint.activate([
            littleYellowCircle.trailingAnchor.constraint(equalTo: avatar.leadingAnchor, constant: 20),
            littleYellowCircle.bottomAnchor.constraint(equalTo: yellowCircle.bottomAnchor, constant: -10),
            littleYellowCircle.widthAnchor.constraint(equalToConstant: Constants.littleYellowCircleSide),
            littleYellowCircle.heightAnchor.constraint(equalToConstant: Constants.littleYellowCircleSide)
        ])
    }
    
    private func setupGreetingLabel() {
        greetingLabel.text = "Привет,\n" + username + "!"
        let greetingLabelText = greetingLabel.text ?? "nil"
        
        let attributedGreetingLabel = NSMutableAttributedString(string: greetingLabelText)
        let usernameRange = (greetingLabelText as NSString).range(of: username)
        attributedGreetingLabel.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: greetingLabel.font.pointSize), range: usernameRange)
        greetingLabel.attributedText = attributedGreetingLabel
        
        view.addSubview(greetingLabel)
        
        NSLayoutConstraint.activate([
            greetingLabel.leadingAnchor.constraint(equalTo: avatar.centerXAnchor, constant: -40),
            greetingLabel.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 20),
            greetingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupStackView() {
        buttonsStack.axis = .vertical
        buttonsStack.spacing = 20
        buttonsStack.distribution = .fillEqually
        
        buttonsStack.addArrangedSubview(teaDiaryButton)
        buttonsStack.addArrangedSubview(ordersButton)
        buttonsStack.addArrangedSubview(friendsButton)
        
        view.addSubview(buttonsStack)
        
        NSLayoutConstraint.activate([
            teaDiaryButton.heightAnchor.constraint(equalToConstant: 50),
            ordersButton.heightAnchor.constraint(equalToConstant: 50),
            friendsButton.heightAnchor.constraint(equalToConstant: 50),
            
            buttonsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonsStack.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 20),
        ])
    }
}
