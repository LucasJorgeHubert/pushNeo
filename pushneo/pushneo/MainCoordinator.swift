//
//  MainCoordinator.swift
//  pushneo
//
//  Created by Lucas Hubert on 10/08/22.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
    func register()
    func pop()
}

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
    }
    
    func start() {
        let vm = LoginViewModel(coordinator: self)
        let vc = LoginViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: false)
    }
    
    func register() {
        let vm = RegisterViewModel(coordinator: self)
        let vc = RegisterViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func listNotifications() {
        let vm = NotificationsViewModel(coordinator: self)
        let vc = NotificationsViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func createApps() {
        let vm = CreateAppViewModel(coordinator: self)
        let vc = CreateAppViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func createWebPush() {
        let vm = SetupWebViewModel(coordinator: self)
        let vc = SetupWebViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func createSMSPush() {
        let vm = SetupSMSViewModel(coordinator: self)
        let vc = SetupSMSViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func createEmailPush() {
        let vm = SetupEmailViewModel(coordinator: self)
        let vc = SetupEmailViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }
}
