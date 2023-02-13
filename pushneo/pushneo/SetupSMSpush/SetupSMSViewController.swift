//
//  SetupSMSViewController.swift
//  pushneo
//
//  Created by Lucas Hubert on 13/08/22.
//

import UIKit

class SetupSMSViewController: UIViewController {

    let viewModel: SetupSMSViewModel
    
    private let mainView = SetupSMSView()
    
    init(viewModel: SetupSMSViewModel) {
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
        self.navigationItem.title = "Configurar SMS push"
        self.navigationItem.largeTitleDisplayMode = .automatic
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        mainView.enableSMSPush.addTarget(self, action: #selector(switchEnableSMSPushChanged), for: UIControl.Event.valueChanged)
        
        mainView.createAppButton.addTarget(self, action: #selector(createApp), for: .touchUpInside)
    }
    
    @objc func switchEnableSMSPushChanged(mySwitch: UISwitch) {
        let value = mySwitch.isOn
        [
            mainView.smsNameTextField,
            mainView.smsLoginTextField,
            mainView.smsPasswordTextField
        ].forEach { $0.isEnabled = value }
    }
    
    @objc func createApp(sender: UIButton!) {
        self.showSpinner(onView: self.mainView)
        
        let data = SMSpushes(
            settings: SMSSettings(
                smsProvider: SMSProvider(
                    name: mainView.smsNameTextField.text ?? "",
                    login: mainView.smsLoginTextField.text ?? "",
                    password: mainView.smsPasswordTextField.text ?? ""
                )
            )
        )
        if mainView.enableSMSPush.isOn {
            Task.init {
                do {
                    try await self.viewModel.enableSMSPush()
                    do {
                        try await self.viewModel.createSMSPush(data: data)
                        self.viewModel.coordinator?.createEmailPush()
                        self.removeSpinner()
                    } catch {
                        self.removeSpinner()
                        self.showToast(
                            text: "Erro ao configurar o SMS Push, tente novamente mais tarde",
                            type: .error,
                            onView: self.mainView
                        )
                    }
                } catch {
                    self.removeSpinner()
                    self.showToast(
                        text: "Erro ao habilitar o canal SMS Push, tente novamente mais tarde",
                        type: .error,
                        onView: self.mainView
                    )
                }
                
            }
        } else {
            self.viewModel.coordinator?.createEmailPush()
            self.removeSpinner()
        }
    }

}
