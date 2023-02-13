//
//  CreateAppView.swift
//  pushneo
//
//  Created by Lucas Hubert on 13/08/22.
//

import UIKit

class CreateAppView: UIView {
    
    var createAppLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.text = "Para gerenciar as notificações com o Vibbraneo, vamos começar criando o App"
        return label
    }()
    
    var appNameTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Nome do app"
        tf.backgroundColor = .systemGray6
        return tf
    }()
    
    var moreInfoAppLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.text = "Nas Próximas telas, você poderá habilitar os canais (Web, SMS ou email) para enviar suas notificações, fique tranquilo, é bem intuítivo 😁"
        return label
    }()
    
    var createAppButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Continuar", for: .normal)
        btn.backgroundColor = .systemGray6
        btn.layer.cornerRadius = 8
        btn.clipsToBounds = true
        btn.isEnabled = false
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
            createAppLabel,
            appNameTextField,
            moreInfoAppLabel,
            createAppButton
        ].forEach { self.addSubview($0) }
    }
    
    private func setupConstraints() {
        [
            createAppLabel,
            appNameTextField,
            moreInfoAppLabel,
            createAppButton
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            createAppLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            createAppLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            createAppLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            appNameTextField.topAnchor.constraint(equalTo: createAppLabel.bottomAnchor, constant: 16),
            appNameTextField.leadingAnchor.constraint(equalTo: createAppLabel.leadingAnchor),
            appNameTextField.trailingAnchor.constraint(equalTo: createAppLabel.trailingAnchor),
            
            moreInfoAppLabel.topAnchor.constraint(equalTo: appNameTextField.bottomAnchor, constant: 16),
            moreInfoAppLabel.leadingAnchor.constraint(equalTo: createAppLabel.leadingAnchor),
            moreInfoAppLabel.trailingAnchor.constraint(equalTo: createAppLabel.trailingAnchor),
            
            createAppButton.topAnchor.constraint(equalTo: moreInfoAppLabel.bottomAnchor, constant: 16),
            createAppButton.leadingAnchor.constraint(equalTo: createAppLabel.leadingAnchor),
            createAppButton.trailingAnchor.constraint(equalTo: createAppLabel.trailingAnchor),

        ])
        
    }

}
