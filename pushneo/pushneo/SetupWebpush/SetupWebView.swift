//
//  SetupWebView.swift
//  pushneo
//
//  Created by Lucas Hubert on 13/08/22.
//

import UIKit

class SetupWebView: UIView {
    
    var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.showsVerticalScrollIndicator = false
        return sv
    }()
    
    var createAppLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.text = "Você pode escolher os meios de envio, dentre eles o meio WEB push"
        return label
    }()
    
    var enableWebPushStack: UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fill
        sv.alignment = .center
        sv.axis = .horizontal
        return sv
    }()
    
    var enableWebLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.text = "Habilitar WEB push"
        return label
    }()
    
    var enableWebPush = UISwitch()
    
    var siteTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 1
        label.text = "Site"
        return label
    }()
    
    var siteNameTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Nome do site"
        tf.backgroundColor = .systemGray6
        tf.isEnabled = false
        return tf
    }()
    
    var siteAddressTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Site (https://www.site.com)"
        tf.backgroundColor = .systemGray6
        tf.isEnabled = false
        return tf
    }()
    
    var urlIconTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "URL do ícone"
        tf.backgroundColor = .systemGray6
        tf.isEnabled = false
        return tf
    }()
    
    var notificationsTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 1
        label.text = "Notificações"
        return label
    }()
    
    var messageTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Mensagem"
        tf.backgroundColor = .systemGray6
        tf.isEnabled = false
        return tf
    }()
    
    var enableOptionTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Texto para permitir"
        tf.backgroundColor = .systemGray6
        tf.isEnabled = false
        return tf
    }()
    
    var disableOptionTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Texto para negar"
        tf.backgroundColor = .systemGray6
        tf.isEnabled = false
        return tf
    }()
    
    var welcomeNotificationsTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 1
        label.text = "Notificações de boas-vindas"
        return label
    }()
    
    var titleWelcomeTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Título"
        tf.backgroundColor = .systemGray6
        tf.isEnabled = false
        return tf
    }()
    
    var messageWelcomeTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Mensagem"
        tf.backgroundColor = .systemGray6
        tf.isEnabled = false
        return tf
    }()
    
    var urlRedirectStack: UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fill
        sv.alignment = .center
        sv.axis = .horizontal
        return sv
    }()
    
    var enableURLLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.text = "Permitir redirecionamento"
        return label
    }()
    
    var enableURLRedirect = UISwitch()
    
    var urlRedirectTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "URL para redirecionar"
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
            enableWebLabel,
            enableWebPush,
        ].forEach { enableWebPushStack.addArrangedSubview($0) }
        
        [
            enableURLLabel,
            enableURLRedirect,
        ].forEach { urlRedirectStack.addArrangedSubview($0) }
        
        [
            createAppLabel,
            enableWebPushStack,
            siteTitleLabel,
            siteNameTextField,
            siteAddressTextField,
            urlIconTextField,
            notificationsTitleLabel,
            messageTextField,
            enableOptionTextField,
            disableOptionTextField,
            welcomeNotificationsTitleLabel,
            titleWelcomeTextField,
            messageWelcomeTextField,
            urlRedirectStack,
            urlRedirectTextField,
            createAppButton
        ].forEach { scrollView.addSubview($0) }
        addSubview(scrollView)
    }
    
    private func setupConstraints() {
        [
            scrollView,
            createAppLabel,
            enableWebPush,
            enableWebLabel,
            enableWebPushStack,
            siteTitleLabel,
            siteNameTextField,
            siteAddressTextField,
            urlIconTextField,
            notificationsTitleLabel,
            messageTextField,
            enableOptionTextField,
            disableOptionTextField,
            welcomeNotificationsTitleLabel,
            titleWelcomeTextField,
            messageWelcomeTextField,
            urlRedirectStack,
            enableURLRedirect,
            urlRedirectTextField,
            createAppButton
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            createAppLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            createAppLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            createAppLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            enableWebPushStack.topAnchor.constraint(equalTo: createAppLabel.bottomAnchor, constant: 16),
            enableWebPushStack.leadingAnchor.constraint(equalTo: createAppLabel.leadingAnchor),
            enableWebPushStack.trailingAnchor.constraint(equalTo: createAppLabel.trailingAnchor),
            
            siteTitleLabel.topAnchor.constraint(equalTo: enableWebPush.bottomAnchor, constant: 16),
            siteTitleLabel.leadingAnchor.constraint(equalTo: createAppLabel.leadingAnchor),
            siteTitleLabel.trailingAnchor.constraint(equalTo: createAppLabel.trailingAnchor),
            
            siteNameTextField.topAnchor.constraint(equalTo: siteTitleLabel.bottomAnchor, constant: 16),
            siteNameTextField.leadingAnchor.constraint(equalTo: createAppLabel.leadingAnchor),
            siteNameTextField.trailingAnchor.constraint(equalTo: createAppLabel.trailingAnchor),
            
            siteAddressTextField.topAnchor.constraint(equalTo: siteNameTextField.bottomAnchor, constant: 16),
            siteAddressTextField.leadingAnchor.constraint(equalTo: createAppLabel.leadingAnchor),
            siteAddressTextField.trailingAnchor.constraint(equalTo: createAppLabel.trailingAnchor),
            
            urlIconTextField.topAnchor.constraint(equalTo: siteAddressTextField.bottomAnchor, constant: 16),
            urlIconTextField.leadingAnchor.constraint(equalTo: createAppLabel.leadingAnchor),
            urlIconTextField.trailingAnchor.constraint(equalTo: createAppLabel.trailingAnchor),
            
            notificationsTitleLabel.topAnchor.constraint(equalTo: urlIconTextField.bottomAnchor, constant: 16),
            notificationsTitleLabel.leadingAnchor.constraint(equalTo: createAppLabel.leadingAnchor),
            notificationsTitleLabel.trailingAnchor.constraint(equalTo: createAppLabel.trailingAnchor),
            
            messageTextField.topAnchor.constraint(equalTo: notificationsTitleLabel.bottomAnchor, constant: 16),
            messageTextField.leadingAnchor.constraint(equalTo: createAppLabel.leadingAnchor),
            messageTextField.trailingAnchor.constraint(equalTo: createAppLabel.trailingAnchor),
            
            enableOptionTextField.topAnchor.constraint(equalTo: messageTextField.bottomAnchor, constant: 16),
            enableOptionTextField.leadingAnchor.constraint(equalTo: createAppLabel.leadingAnchor),
            enableOptionTextField.trailingAnchor.constraint(equalTo: createAppLabel.trailingAnchor),
            
            disableOptionTextField.topAnchor.constraint(equalTo: enableOptionTextField.bottomAnchor, constant: 16),
            disableOptionTextField.leadingAnchor.constraint(equalTo: createAppLabel.leadingAnchor),
            disableOptionTextField.trailingAnchor.constraint(equalTo: createAppLabel.trailingAnchor),
            
            welcomeNotificationsTitleLabel.topAnchor.constraint(equalTo: disableOptionTextField.bottomAnchor, constant: 16),
            welcomeNotificationsTitleLabel.leadingAnchor.constraint(equalTo: createAppLabel.leadingAnchor),
            welcomeNotificationsTitleLabel.trailingAnchor.constraint(equalTo: createAppLabel.trailingAnchor),
            
            titleWelcomeTextField.topAnchor.constraint(equalTo: welcomeNotificationsTitleLabel.bottomAnchor, constant: 16),
            titleWelcomeTextField.leadingAnchor.constraint(equalTo: createAppLabel.leadingAnchor),
            titleWelcomeTextField.trailingAnchor.constraint(equalTo: createAppLabel.trailingAnchor),
            
            messageWelcomeTextField.topAnchor.constraint(equalTo: titleWelcomeTextField.bottomAnchor, constant: 16),
            messageWelcomeTextField.leadingAnchor.constraint(equalTo: createAppLabel.leadingAnchor),
            messageWelcomeTextField.trailingAnchor.constraint(equalTo: createAppLabel.trailingAnchor),
            
            urlRedirectStack.topAnchor.constraint(equalTo: messageWelcomeTextField.bottomAnchor, constant: 16),
            urlRedirectStack.leadingAnchor.constraint(equalTo: createAppLabel.leadingAnchor),
            urlRedirectStack.trailingAnchor.constraint(equalTo: createAppLabel.trailingAnchor),
            
            urlRedirectTextField.topAnchor.constraint(equalTo: urlRedirectStack.bottomAnchor, constant: 16),
            urlRedirectTextField.leadingAnchor.constraint(equalTo: createAppLabel.leadingAnchor),
            urlRedirectTextField.trailingAnchor.constraint(equalTo: createAppLabel.trailingAnchor),
            
            createAppButton.topAnchor.constraint(equalTo: urlRedirectTextField.bottomAnchor, constant: 16),
            createAppButton.leadingAnchor.constraint(equalTo: createAppLabel.leadingAnchor),
            createAppButton.trailingAnchor.constraint(equalTo: createAppLabel.trailingAnchor),
            createAppButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            
        ])
        
    }

}
