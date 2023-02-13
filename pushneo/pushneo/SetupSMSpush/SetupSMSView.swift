//
//  SetupSMSView.swift
//  pushneo
//
//  Created by Lucas Hubert on 13/08/22.
//

import UIKit

class SetupSMSView: UIView {
    
    var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.showsVerticalScrollIndicator = false
        return sv
    }()
    
    var createAppSMSLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.text = "Tambem temos a opção de habilitar a opção de SMS"
        return label
    }()
    
    var enableSMSPushStack: UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fill
        sv.alignment = .center
        sv.axis = .horizontal
        return sv
    }()
    
    var enableSMSLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.text = "Habilitar SMS push"
        return label
    }()
    
    var enableSMSPush = UISwitch()
    
    var smsTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 1
        label.text = "Dados para autenticação"
        return label
    }()
    
    var smsNameTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Nome"
        tf.backgroundColor = .systemGray6
        tf.isEnabled = false
        return tf
    }()
    
    var smsLoginTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Login"
        tf.backgroundColor = .systemGray6
        tf.isEnabled = false
        return tf
    }()
    
    var smsPasswordTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Senha"
        tf.backgroundColor = .systemGray6
        tf.isEnabled = false
        return tf
    }()
    
    var createAppButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Continuar", for: .normal)
        btn.backgroundColor = .systemBlue
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
            enableSMSLabel,
            enableSMSPush,
        ].forEach { enableSMSPushStack.addArrangedSubview($0) }
        [
            createAppSMSLabel,
            enableSMSPushStack,
            smsTitleLabel,
            smsNameTextField,
            smsLoginTextField,
            smsPasswordTextField,
            createAppButton
        ].forEach { scrollView.addSubview($0) }
        addSubview(scrollView)
    }
    
    private func setupConstraints() {
        [
            scrollView,
            enableSMSPushStack,
            createAppSMSLabel,
            smsTitleLabel,
            smsNameTextField,
            smsLoginTextField,
            smsPasswordTextField,
            createAppButton
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            createAppSMSLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            createAppSMSLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            createAppSMSLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            enableSMSPushStack.topAnchor.constraint(equalTo: createAppSMSLabel.bottomAnchor, constant: 16),
            enableSMSPushStack.leadingAnchor.constraint(equalTo: createAppSMSLabel.leadingAnchor),
            enableSMSPushStack.trailingAnchor.constraint(equalTo: createAppSMSLabel.trailingAnchor),
            
            smsTitleLabel.topAnchor.constraint(equalTo: enableSMSPushStack.bottomAnchor, constant: 16),
            smsTitleLabel.leadingAnchor.constraint(equalTo: createAppSMSLabel.leadingAnchor),
            smsTitleLabel.trailingAnchor.constraint(equalTo: createAppSMSLabel.trailingAnchor),
            
            smsNameTextField.topAnchor.constraint(equalTo: smsTitleLabel.bottomAnchor, constant: 16),
            smsNameTextField.leadingAnchor.constraint(equalTo: createAppSMSLabel.leadingAnchor),
            smsNameTextField.trailingAnchor.constraint(equalTo: createAppSMSLabel.trailingAnchor),
            
            smsLoginTextField.topAnchor.constraint(equalTo: smsNameTextField.bottomAnchor, constant: 16),
            smsLoginTextField.leadingAnchor.constraint(equalTo: createAppSMSLabel.leadingAnchor),
            smsLoginTextField.trailingAnchor.constraint(equalTo: createAppSMSLabel.trailingAnchor),
            
            smsPasswordTextField.topAnchor.constraint(equalTo: smsLoginTextField.bottomAnchor, constant: 16),
            smsPasswordTextField.leadingAnchor.constraint(equalTo: createAppSMSLabel.leadingAnchor),
            smsPasswordTextField.trailingAnchor.constraint(equalTo: createAppSMSLabel.trailingAnchor),
            
            createAppButton.topAnchor.constraint(equalTo: smsPasswordTextField.bottomAnchor, constant: 16),
            createAppButton.leadingAnchor.constraint(equalTo: createAppSMSLabel.leadingAnchor),
            createAppButton.trailingAnchor.constraint(equalTo: createAppSMSLabel.trailingAnchor),
            createAppButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            
        ])
        
    }

}
