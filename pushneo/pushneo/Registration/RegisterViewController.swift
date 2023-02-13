//
//  RegisterViewController.swift
//  pushneo
//
//  Created by Lucas Hubert on 10/08/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    // MARK: Components
    private let mainView = RegisterView()
    
    private let viewModel: RegisterViewModel
    private let isValidRegister = IsValidRegister()
    
    init(viewModel: RegisterViewModel) {
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
        setupButtons()
        setupTextField()
        self.navigationItem.title = "Registrar"
        self.navigationItem.largeTitleDisplayMode = .automatic
    }
    
    private func setupButtons() {
        mainView.registerButton.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
        mainView.cancelButton.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
    }
    
    private func setupTextField() {
        mainView.nameTextField.addTarget(self, action: #selector(fullNameTextFieldDidChange(textField:)), for: UIControl.Event.editingDidEnd)
        mainView.emailTextField.addTarget(self, action: #selector(emailTextFieldDidChange(textField:)), for: UIControl.Event.editingDidEnd)
        mainView.passTextField.addTarget(self, action: #selector(passwordTextFieldDidChange(textField:)), for: UIControl.Event.editingDidEnd)
    }
    
    @objc
    private func fullNameTextFieldDidChange(textField: UITextField) {
        if !(textField.text?.isEmpty ?? false) {
            if textField.text?.count ?? 0 >= 3 {
                if textField.text?.filter({ $0 == " " }).count ?? 0 >= 1 {
                    isValidRegister.validFullname = true
                    enableRegisterButton()
                }
            }
        }
    }
    
    @objc
    private func emailTextFieldDidChange(textField: UITextField) {
        if !(textField.text?.isEmpty ?? false) {
            if textField.text?.count ?? 0 >= 3 {
                if textField.text?.filter({ $0 == "@" }).count ?? 0 == 1 {
                    isValidRegister.validEmail = true
                    enableRegisterButton()
                }
            }
        }
    }
    
    @objc
    private func passwordTextFieldDidChange(textField: UITextField) {
        if !(textField.text?.isEmpty ?? false) {
            if textField.text?.count ?? 0 >= 5 {
                isValidRegister.validPassword = true
                enableRegisterButton()
            }
        }
    }
    
    private func enableRegisterButton() {
        if isValidRegister.allParametersAreValids() {
            mainView.registerButton.isEnabled = true
            mainView.registerButton.backgroundColor = .systemBlue
        }
    }
    
    @objc
    private func didTapCancelButton() {
        self.viewModel.coordinator.pop()
    }
    
    @objc
    private func didTapRegisterButton() {
        Task.init {
            do {
                try await self.viewModel.signUp(params: AuthRegister(
                    fullname: mainView.nameTextField.text ?? "",
                    email: mainView.emailTextField.text ?? "",
                    password: mainView.passTextField.text ?? "",
                    companyName: mainView.companyTextField.text ?? "",
                    companyAddress: mainView.companyAddressTextField.text ?? "",
                    companyTellphone: mainView.companyTelephoneTextField.text ?? ""
                ))
                let alert = UIAlertController(title: "Sucesso", message: "Usuário criado com sucesso", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    self.viewModel.coordinator.pop()
                }))
                self.present(alert, animated: true, completion: nil)
            } catch {
                self.showToast(text: "Erro ao criar usuário", type: .error, onView: self.mainView)
            }
        }
    }
}
