//
//  SetupWebViewController.swift
//  pushneo
//
//  Created by Lucas Hubert on 13/08/22.
//

import UIKit

class SetupWebViewController: UIViewController {

    let viewModel: SetupWebViewModel
    
    private let mainView = SetupWebView()
    
    init(viewModel: SetupWebViewModel) {
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
        self.navigationItem.title = "Configurar WEB push"
        self.navigationItem.largeTitleDisplayMode = .automatic
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        mainView.enableWebPush.addTarget(self, action: #selector(switchEnableWEBPushChanged), for: UIControl.Event.valueChanged)
        mainView.enableURLRedirect.addTarget(self, action: #selector(switchRedirectURLChanged), for: UIControl.Event.valueChanged)
        
        mainView.createAppButton.addTarget(self, action: #selector(createApp), for: .touchUpInside)
    }
    
    @objc func switchEnableWEBPushChanged(mySwitch: UISwitch) {
        let value = mySwitch.isOn
        [
            mainView.siteNameTextField,
            mainView.siteAddressTextField,
            mainView.urlIconTextField,
            mainView.messageTextField,
            mainView.enableOptionTextField,
            mainView.disableOptionTextField,
            mainView.titleWelcomeTextField,
            mainView.messageWelcomeTextField
        ].forEach { $0.isEnabled = value }
    }
    
    @objc func switchRedirectURLChanged(mySwitch: UISwitch) {
        let value = mySwitch.isOn
        mainView.urlRedirectTextField.isEnabled = value
    }
    
    @objc func createApp(sender: UIButton!) {
        self.showSpinner(onView: self.mainView)
        
        let data = Webpushes(
            settings: Settings(
                site: Site(
                    name: mainView.siteNameTextField.text ?? "",
                    address: mainView.siteAddressTextField.text ?? "",
                    urlIcon: mainView.urlIconTextField.text ?? ""
                ),
                allowNotification: AllowNotification(
                    messageText: mainView.messageTextField.text ?? "",
                    allowButtonText: mainView.enableOptionTextField.text ?? "",
                    denyButtonText: mainView.disableOptionTextField.text ?? ""
                ),
                welcomeNotification: WelcomeNotification(
                    messageTitle: mainView.titleWelcomeTextField.text ?? "",
                    messageText: mainView.messageWelcomeTextField.text ?? "",
                    enableURLRedirect: mainView.enableURLRedirect.isOn ? 1 : 0,
                    urlRedirect: mainView.urlRedirectTextField.text ?? "")
            )
        )
        if mainView.enableWebPush.isOn {
            Task.init {
                do {
                    try await self.viewModel.enableWebPush()
                    do {
                        try await self.viewModel.createWebPush(data: data)
                        self.viewModel.coordinator?.createSMSPush()
                        self.removeSpinner()
                    } catch {
                        self.removeSpinner()
                        self.showToast(
                            text: "Erro ao configurar o WEB Push, tente novamente mais tarde",
                            type: .error,
                            onView: self.mainView
                        )
                    }
                } catch {
                    self.removeSpinner()
                    self.showToast(
                        text: "Erro ao habilitar o canal WEB Push, tente novamente mais tarde",
                        type: .error,
                        onView: self.mainView
                    )
                }
                
            }
        } else {
            self.viewModel.coordinator?.createSMSPush()
            self.removeSpinner()
        }
    }
}
