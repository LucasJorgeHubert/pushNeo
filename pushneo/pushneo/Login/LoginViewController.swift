//
//  ViewController.swift
//  pushneo
//
//  Created by Lucas Hubert on 09/08/22.
//

import UIKit
import Foundation

class LoginViewController: UIViewController {
    
    private let mainView = LoginView()
    
    private let viewModel: LoginViewModel
    private let isValidLogin = IsValidLogin()
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Vibbraneo"
        self.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationItem.hidesBackButton = true
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        setupTextField()
        
        mainView.registerButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        mainView.loginButton.addTarget(self, action: #selector(makeSignin), for: .touchUpInside)
    }
    
    @objc func buttonAction(sender: UIButton!) {
       viewModel.coordinator.register()
    }
    
    private func setupTextField() {
        mainView.loginTextField.addTarget(self, action: #selector(emailTextFieldDidChange(textField:)), for: UIControl.Event.editingDidEnd)
        mainView.passwordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
    }
    
    @objc
    private func emailTextFieldDidChange(textField: UITextField) {
        if !(textField.text?.isEmpty ?? false) {
            if textField.text?.count ?? 0 >= 3 {
                if textField.text?.filter({ $0 == "@" }).count ?? 0 == 1 {
                    isValidLogin.validEmail = true
                    enableLoginButton()
                }
            }
        }
    }
    
    @objc
    private func passwordTextFieldDidChange(textField: UITextField) {
        if !(textField.text?.isEmpty ?? false) {
            if textField.text?.count ?? 0 >= 5 {
                isValidLogin.validPassword = true
                enableLoginButton()
            }
        }
    }
    
    private func enableLoginButton() {
        if isValidLogin.allParametersAreValids() {
            mainView.loginButton.isEnabled = true
            mainView.loginButton.backgroundColor = .systemBlue
        }
    }
    
    @objc func makeSignin(sender: UIButton!) {
        self.showSpinner(onView: self.mainView)
        guard let email = mainView.loginTextField.text,
                let pass = mainView.passwordTextField.text
        else { return }
        Task.init {
            do {
                try await self.viewModel.signIn(
                    email: email,
                    password: pass,
                    stayLoggedIn: mainView.stayLoggedInSwith.isOn
                )
                
                self.removeSpinner()
                if UserDefaults.standard.string(forKey: "appID") != nil {
                    self.viewModel.coordinator.listNotifications()
                } else {
                    self.viewModel.coordinator.createApps()
                }
            } catch {
                self.removeSpinner()
                self.showToast(text: "Erro no Login, tente novamente mais tarde", type: .error, onView: self.mainView)
            }
        }
    }
}
