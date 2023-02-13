//
//  LoginView.swift
//  pushneo
//
//  Created by Lucas Hubert on 11/08/22.
//

import UIKit

class LoginView: UIView {
    
    var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.showsVerticalScrollIndicator = false
        return sv
    }()
    
    private var loginLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.text = "Login"
        return label
    }()
    
    var loginTextField: UITextField = {
        let tf = UITextField()
        tf.keyboardType = .emailAddress
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .systemGray6
        return tf
    }()
    
    var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.keyboardType = .numberPad
        tf.isSecureTextEntry = true
        tf.backgroundColor = .systemGray6
        return tf
    }()
    
    var loginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Entrar", for: .normal)
        btn.backgroundColor = .systemGray6
        btn.layer.cornerRadius = 8
        btn.clipsToBounds = true
        btn.isEnabled = false
        return btn
    }()
    
    var stayLoggedInStack: UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fill
        sv.alignment = .center
        sv.axis = .horizontal
        return sv
    }()
    
    var stayLoggedInLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.text = "Permanecer conectado"
        return label
    }()
    
    var stayLoggedInSwith = UISwitch()
    
    var registerButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Registrar", for: .normal)
        btn.setTitleColor(UIColor.systemBlue, for: .normal)
        btn.layer.borderColor = UIColor.systemBlue.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 8
        btn.clipsToBounds = true
        return btn
    }()
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .systemBackground
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViewHierarchy() {
        [
            stayLoggedInLabel,
            stayLoggedInSwith
        ].forEach { stayLoggedInStack.addArrangedSubview($0) }
        [
            loginLabel,
            loginTextField,
            passwordTextField,
            stayLoggedInStack,
            loginButton,
            registerButton
        ].forEach { scrollView.addSubview($0) }
        addSubview(scrollView)
    }
    
    private func setupConstraints() {
        [
            scrollView,
            loginLabel,
            loginTextField,
            passwordTextField,
            stayLoggedInStack,
            stayLoggedInLabel,
            stayLoggedInSwith,
            loginButton,
            registerButton
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            loginLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 24),
            loginLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            loginLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 16),
            loginTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            loginTextField.trailingAnchor.constraint(equalTo: loginLabel.trailingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 16),
            passwordTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: loginLabel.trailingAnchor),
            
            stayLoggedInStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stayLoggedInStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stayLoggedInStack.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 24),
            
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            loginButton.topAnchor.constraint(equalTo: stayLoggedInStack.bottomAnchor, constant: 24),
            
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16),
            registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
}
