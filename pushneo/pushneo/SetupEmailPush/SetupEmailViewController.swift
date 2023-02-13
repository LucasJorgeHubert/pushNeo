//
//  SetupEmailViewController.swift
//  pushneo
//
//  Created by Lucas Hubert on 14/08/22.
//

import UIKit

class SetupEmailViewController: UIViewController {
    let viewModel: SetupEmailViewModel
    
    private let mainView = SetupEmailView()
    
    var templates: [EmailTemplate] = []
    
    init(viewModel: SetupEmailViewModel) {
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
        self.navigationItem.title = "Configurar Email push"
        self.navigationItem.largeTitleDisplayMode = .automatic
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        
        mainView.enableEmailPush.addTarget(self, action: #selector(switchEnableEmailPushChanged), for: UIControl.Event.valueChanged)
        mainView.createAppButton.addTarget(self, action: #selector(createApp), for: .touchUpInside)
        mainView.addTemplateButton.addTarget(self, action: #selector(addTemplate), for: .touchUpInside)
    }
    
    @objc func addTemplate() {
        let template = EmailTemplate(
            name: mainView.emailTemplateNameTextField.text ?? "",
            uri: mainView.emailTemplateURITextField.text ?? ""
        )
        self.templates.append(template)
        mainView.tableView.reloadData()
    }
    
    @objc func switchEnableEmailPushChanged(mySwitch: UISwitch) {
        let value = mySwitch.isOn
        [
            mainView.emailSMTPNameTextField,
            mainView.emailSMTPPortTextField,
            mainView.emailUserLoginTextField,
            mainView.emailUserPasswordTextField,
            mainView.emailSenderNameTextField,
            mainView.emailSenderEmailTextField,
            mainView.emailTemplateNameTextField,
            mainView.emailTemplateURITextField
        ].forEach { $0.isEnabled = value }
    }
    
    @objc func createApp(sender: UIButton!) {
        self.showSpinner(onView: self.mainView)
        
        let data = EmailPushes(
            settings: EmailSettings(
                server: Server(
                    smtpName: mainView.emailSMTPNameTextField.text ?? "",
                    smptPort: mainView.emailSMTPPortTextField.text ?? "",
                    userLogin: mainView.emailUserLoginTextField.text ?? "",
                    userPassword: mainView.emailUserPasswordTextField.text ?? ""
                ),
                sender: Sender(
                    name: mainView.emailSenderNameTextField.text ?? "",
                    email: mainView.emailSenderEmailTextField.text ?? ""
                ),
                emailTemplates: self.templates
            )
        )

        Task.init {
            do {
                try await self.viewModel.enableEmailPush()
                do {
                    try await self.viewModel.createEmailPush(data: data)
                    self.removeSpinner()
                    self.viewModel.coordinator?.listNotifications()
                } catch {
                    self.removeSpinner()
                    self.showToast(
                        text: "Erro ao configurar o Email Push, tente novamente mais tarde",
                        type: .error,
                        onView: self.mainView
                    )
                }
                
            } catch {
                self.removeSpinner()
                self.showToast(
                    text: "Erro ao habilitar o canal Email Push, tente novamente mais tarde",
                    type: .error,
                    onView: self.mainView
                )
            }
            
        }
    }

}

extension SetupEmailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.templates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "\(self.templates[indexPath.row].name) - \(self.templates[indexPath.row].uri)"
        
        return cell
    }
    
    
}
