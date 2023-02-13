//
//  CreateAppViewController.swift
//  pushneo
//
//  Created by Lucas Hubert on 13/08/22.
//

import UIKit

class CreateAppViewController: UIViewController {

    private let viewModel: CreateAppViewModel
    
    private let mainView = CreateAppView()
    
    init(viewModel: CreateAppViewModel) {
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
    
    let fruits : Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Criar Push App"
        self.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationItem.hidesBackButton = true
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        mainView.createAppButton.addTarget(self, action: #selector(createApp), for: .touchUpInside)
        mainView.appNameTextField.addTarget(self, action: #selector(appNameTextFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func createApp(sender: UIButton!) {
        self.showSpinner(onView: self.mainView)
        guard let appName = mainView.appNameTextField.text else { return }
        
        Task.init {
            do {
                try await self.viewModel.createApp(appName: appName)
                self.viewModel.coordinator?.createWebPush()
                self.removeSpinner()
            } catch {
                self.removeSpinner()
                self.showToast(
                    text: "Erro ao criar o aplicativo, tente novamente mais tarde",
                    type: .error,
                    onView: self.mainView
                )
            }
        }
    }
    
    @objc
    private func appNameTextFieldDidChange(textField: UITextField) {
        if !(textField.text?.isEmpty ?? false) {
            if textField.text?.count ?? 0 >= 3 {
                mainView.createAppButton.isEnabled = true
                mainView.createAppButton.backgroundColor = .systemBlue
            }
        }
    }
}
