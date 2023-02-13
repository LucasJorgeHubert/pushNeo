//
//  SetupEmailView.swift
//  pushneo
//
//  Created by Lucas Hubert on 14/08/22.
//

import UIKit

class SetupEmailView: UIView {
    
    var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.showsVerticalScrollIndicator = false
        return sv
    }()
    
    var createAppEmailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.text = "Tambem temos a opção de habilitar a opção de Email"
        return label
    }()
    
    var enableEmailPushStack: UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fill
        sv.alignment = .center
        sv.axis = .horizontal
        return sv
    }()
    
    var enableEmailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.text = "Habilitar Email push"
        return label
    }()
    
    var enableEmailPush = UISwitch()
    
    var emailServerTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 1
        label.text = "Server"
        return label
    }()
    
    var emailSMTPNameTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Nome SMTP"
        tf.backgroundColor = .systemGray6
        tf.isEnabled = false
        return tf
    }()
    
    var emailSMTPPortTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Porta SMTP"
        tf.backgroundColor = .systemGray6
        tf.isEnabled = false
        return tf
    }()
    
    var emailUserLoginTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "SMTP Login"
        tf.backgroundColor = .systemGray6
        tf.isEnabled = false
        return tf
    }()
    
    var emailUserPasswordTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "SMTP Password"
        tf.backgroundColor = .systemGray6
        tf.isEnabled = false
        return tf
    }()
    
    var emailSenderTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 1
        label.text = "Sender"
        return label
    }()
    
    var emailSenderNameTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Nome"
        tf.backgroundColor = .systemGray6
        tf.isEnabled = false
        return tf
    }()
    
    var emailSenderEmailTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "E-mail"
        tf.backgroundColor = .systemGray6
        tf.isEnabled = false
        return tf
    }()
    
    var emailTemplateTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 1
        label.text = "Templates"
        return label
    }()
    
    var emailTemplateNameTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Nome"
        tf.backgroundColor = .systemGray6
        tf.isEnabled = false
        return tf
    }()
    
    var emailTemplateURITextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "URI"
        tf.backgroundColor = .systemGray6
        tf.isEnabled = false
        return tf
    }()
    
    var addTemplateButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Adicionar template", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 8
        btn.clipsToBounds = true
        return btn
    }()
    
    var tableView = UITableView()
    
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
            enableEmailLabel,
            enableEmailPush,
        ].forEach { enableEmailPushStack.addArrangedSubview($0) }
        [
            createAppEmailLabel,
            enableEmailPushStack,
            emailServerTitleLabel,
            emailSMTPNameTextField,
            emailSMTPPortTextField,
            emailUserLoginTextField,
            emailUserPasswordTextField,
            emailSenderTitleLabel,
            emailSenderNameTextField,
            emailSenderEmailTextField,
            emailTemplateTitleLabel,
            emailTemplateNameTextField,
            emailTemplateURITextField,
            addTemplateButton,
            tableView,
            createAppButton
        ].forEach { scrollView.addSubview($0) }
        addSubview(scrollView)
    }
    
    private func setupConstraints() {
        [
            scrollView,
            createAppEmailLabel,
            enableEmailPushStack,
            emailServerTitleLabel,
            emailSMTPNameTextField,
            emailSMTPPortTextField,
            emailUserLoginTextField,
            emailUserPasswordTextField,
            emailSenderTitleLabel,
            emailSenderNameTextField,
            emailSenderEmailTextField,
            emailTemplateTitleLabel,
            emailTemplateNameTextField,
            emailTemplateURITextField,
            addTemplateButton,
            tableView,
            createAppButton
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            createAppEmailLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            createAppEmailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            createAppEmailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            enableEmailPushStack.topAnchor.constraint(equalTo: createAppEmailLabel.bottomAnchor, constant: 16),
            enableEmailPushStack.leadingAnchor.constraint(equalTo: createAppEmailLabel.leadingAnchor),
            enableEmailPushStack.trailingAnchor.constraint(equalTo: createAppEmailLabel.trailingAnchor),
            
            emailServerTitleLabel.topAnchor.constraint(equalTo: enableEmailPushStack.bottomAnchor, constant: 16),
            emailServerTitleLabel.leadingAnchor.constraint(equalTo: createAppEmailLabel.leadingAnchor),
            emailServerTitleLabel.trailingAnchor.constraint(equalTo: createAppEmailLabel.trailingAnchor),
            
            emailSMTPNameTextField.topAnchor.constraint(equalTo: emailServerTitleLabel.bottomAnchor, constant: 16),
            emailSMTPNameTextField.leadingAnchor.constraint(equalTo: createAppEmailLabel.leadingAnchor),
            emailSMTPNameTextField.trailingAnchor.constraint(equalTo: createAppEmailLabel.trailingAnchor),
            
            emailSMTPPortTextField.topAnchor.constraint(equalTo: emailSMTPNameTextField.bottomAnchor, constant: 16),
            emailSMTPPortTextField.leadingAnchor.constraint(equalTo: createAppEmailLabel.leadingAnchor),
            emailSMTPPortTextField.trailingAnchor.constraint(equalTo: createAppEmailLabel.trailingAnchor),
            
            emailUserLoginTextField.topAnchor.constraint(equalTo: emailSMTPPortTextField.bottomAnchor, constant: 16),
            emailUserLoginTextField.leadingAnchor.constraint(equalTo: createAppEmailLabel.leadingAnchor),
            emailUserLoginTextField.trailingAnchor.constraint(equalTo: createAppEmailLabel.trailingAnchor),
            
            emailUserPasswordTextField.topAnchor.constraint(equalTo: emailUserLoginTextField.bottomAnchor, constant: 16),
            emailUserPasswordTextField.leadingAnchor.constraint(equalTo: createAppEmailLabel.leadingAnchor),
            emailUserPasswordTextField.trailingAnchor.constraint(equalTo: createAppEmailLabel.trailingAnchor),
            
            emailSenderTitleLabel.topAnchor.constraint(equalTo: emailUserPasswordTextField.bottomAnchor, constant: 16),
            emailSenderTitleLabel.leadingAnchor.constraint(equalTo: createAppEmailLabel.leadingAnchor),
            emailSenderTitleLabel.trailingAnchor.constraint(equalTo: createAppEmailLabel.trailingAnchor),
            
            emailSenderNameTextField.topAnchor.constraint(equalTo: emailSenderTitleLabel.bottomAnchor, constant: 16),
            emailSenderNameTextField.leadingAnchor.constraint(equalTo: createAppEmailLabel.leadingAnchor),
            emailSenderNameTextField.trailingAnchor.constraint(equalTo: createAppEmailLabel.trailingAnchor),
            
            emailSenderEmailTextField.topAnchor.constraint(equalTo: emailSenderNameTextField.bottomAnchor, constant: 16),
            emailSenderEmailTextField.leadingAnchor.constraint(equalTo: createAppEmailLabel.leadingAnchor),
            emailSenderEmailTextField.trailingAnchor.constraint(equalTo: createAppEmailLabel.trailingAnchor),
            
            emailTemplateTitleLabel.topAnchor.constraint(equalTo: emailSenderEmailTextField.bottomAnchor, constant: 16),
            emailTemplateTitleLabel.leadingAnchor.constraint(equalTo: createAppEmailLabel.leadingAnchor),
            emailTemplateTitleLabel.trailingAnchor.constraint(equalTo: createAppEmailLabel.trailingAnchor),
            
            emailTemplateNameTextField.topAnchor.constraint(equalTo: emailTemplateTitleLabel.bottomAnchor, constant: 16),
            emailTemplateNameTextField.leadingAnchor.constraint(equalTo: createAppEmailLabel.leadingAnchor),
            emailTemplateNameTextField.trailingAnchor.constraint(equalTo: createAppEmailLabel.trailingAnchor),
            
            emailTemplateURITextField.topAnchor.constraint(equalTo: emailTemplateNameTextField.bottomAnchor, constant: 16),
            emailTemplateURITextField.leadingAnchor.constraint(equalTo: createAppEmailLabel.leadingAnchor),
            emailTemplateURITextField.trailingAnchor.constraint(equalTo: createAppEmailLabel.trailingAnchor),
            
            addTemplateButton.topAnchor.constraint(equalTo: emailTemplateURITextField.bottomAnchor, constant: 16),
            addTemplateButton.leadingAnchor.constraint(equalTo: createAppEmailLabel.leadingAnchor),
            addTemplateButton.trailingAnchor.constraint(equalTo: createAppEmailLabel.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: addTemplateButton.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: createAppEmailLabel.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: createAppEmailLabel.trailingAnchor),
            tableView.heightAnchor.constraint(greaterThanOrEqualToConstant: 150),
            
            createAppButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 16),
            createAppButton.leadingAnchor.constraint(equalTo: createAppEmailLabel.leadingAnchor),
            createAppButton.trailingAnchor.constraint(equalTo: createAppEmailLabel.trailingAnchor),
            createAppButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            
        ])
        
    }


}
