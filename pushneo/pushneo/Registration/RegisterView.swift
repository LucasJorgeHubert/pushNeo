//
//  RegisterView.swift
//  pushneo
//
//  Created by Lucas Hubert on 10/08/22.
//

import UIKit

class RegisterView: UIView {
    
    var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.showsVerticalScrollIndicator = false
        return sv
    }()

    var nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Nome completo"
        tf.keyboardType = .alphabet
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .systemGray6
        return tf
    }()
    
    var emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.keyboardType = .emailAddress
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .systemGray6
        return tf
    }()
    
    var passTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Senha numérica"
        tf.keyboardType = .numberPad
        tf.isSecureTextEntry = true
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .systemGray6
        return tf
    }()
    
    var companyTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Nome da empresa"
        tf.keyboardType = .alphabet
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .systemGray6
        return tf
    }()
    
    var companyAddressTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Endereço da empresa"
        tf.keyboardType = .default
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .systemGray6
        return tf
    }()
    
    var companyTelephoneTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Telefone da empresa"
        tf.keyboardType = .phonePad
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .systemGray6
        return tf
    }()
    
    var registerButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Registrar", for: .normal)
        btn.backgroundColor = .systemGray6
        btn.layer.cornerRadius = 8
        btn.clipsToBounds = true
        btn.isEnabled = false
        return btn
    }()
    
    var cancelButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Cancelar", for: .normal)
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
            nameTextField,
            emailTextField,
            passTextField,
            companyTextField,
            companyAddressTextField,
            companyTelephoneTextField,
            registerButton,
            cancelButton
        ].forEach { scrollView.addSubview($0) }
        addSubview(scrollView)
    }
    
    private func setupConstraints() {
        [
            scrollView,
            nameTextField,
            emailTextField,
            passTextField,
            companyTextField,
            companyAddressTextField,
            companyTelephoneTextField,
            registerButton,
            cancelButton
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            emailTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            
            passTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            passTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            
            companyTextField.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 16),
            companyTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            companyTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            
            companyAddressTextField.topAnchor.constraint(
                equalTo: companyTextField.bottomAnchor,
                constant: 16
            ),
            companyAddressTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            companyAddressTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            
            companyTelephoneTextField.topAnchor.constraint(
                equalTo: companyAddressTextField.bottomAnchor,
                constant: 16
            ),
            companyTelephoneTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            companyTelephoneTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            
            
            registerButton.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            registerButton.topAnchor.constraint(
                equalTo: companyTelephoneTextField.bottomAnchor,
                constant: 24
            ),
            
            cancelButton.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            cancelButton.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            cancelButton.topAnchor.constraint(
                equalTo: registerButton.bottomAnchor,
                constant: 16
            ),
            
        ])
    }
}
