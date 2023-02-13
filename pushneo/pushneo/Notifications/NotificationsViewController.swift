//
//  NotificationsViewController.swift
//  pushneo
//
//  Created by Lucas Hubert on 12/08/22.
//

import UIKit

class NotificationsViewController: UIViewController {
    
    private let viewModel: NotificationsViewModel
    
    private let mainView = NotificationsView()
    private var notifications = [Notifications]()
    private var allNotifications = [Notifications]()
    
    init(viewModel: NotificationsViewModel) {
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
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshTableAction)),
            UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(logoutAction))
        ]
        
        setupTableView()
        setupTableData()
        
        mainView.segmentedControlFilter.addTarget(self, action: #selector(changeFilterOption), for: .valueChanged)
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func refreshTableAction() {
        self.mainView.segmentedControlFilter.selectedSegmentIndex = 0
        self.setupTableData()
    }
    
    @objc func logoutAction() {
        UserDefaults.standard.removeObject(forKey: "token")
        UserDefaults.standard.removeObject(forKey: "appID")
        UserDefaults.standard.removeObject(forKey: "appSetupCompleted")
        self.viewModel.coordinator?.start()
    }
    
    private func setupTableView() {
        mainView.notificatonsTable.dataSource = self
        mainView.notificatonsTable.delegate = self
        mainView.notificatonsTable.register(NotificationsTableViewCell.self, forCellReuseIdentifier: "NotificationsTableViewCell")
    }
    
    @objc func changeFilterOption(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
                notifications = allNotifications
                mainView.notificatonsTable.reloadData()
            case 1:
                notifications = allNotifications.filter { $0.type == .web }
                mainView.notificatonsTable.reloadData()
            case 2:
                notifications = allNotifications.filter { $0.type == .sms }
                mainView.notificatonsTable.reloadData()
            case 3:
                notifications = allNotifications.filter { $0.type == .email }
                mainView.notificatonsTable.reloadData()
            default:
                notifications = allNotifications
                mainView.notificatonsTable.reloadData()
        }
    }
    
    private func setupTableData() {
        self.showSpinner(onView: self.mainView)
        Task.init {
            do {
                self.allNotifications = try await getNotifications()
                self.notifications = allNotifications
                self.mainView.notificatonsTable.reloadData()
                self.removeSpinner()

            } catch {
                self.removeSpinner()
                self.showToast(
                    text: "Erro ao carregar as notificações, tente novamente mais tarde",
                    type: .error,
                    onView: self.mainView
                )
            }
        }
    }
    
    private func getNotifications() async throws -> ([Notifications]) {
        var notifications = [Notifications]()
        
        let data = try await self.viewModel.fetchWebNotifications()
        data.notifications.forEach { item in
            let notification = Notifications(
                notificationID: item.notificationID,
                sendDate: item.sendDate,
                type: .web
            )
            notifications.append(notification)
        }
        let data1 = try await self.viewModel.fetchSMSNotifications()
        data1.notifications.forEach { item1 in
            let notification = Notifications(
                notificationID: item1.notificationID,
                sendDate: item1.sendDate,
                type: .sms
            )
            notifications.append(notification)
        }
        let data2 = try await self.viewModel.fetchEmailNotifications()
        data2.notifications.forEach { item2 in
            let notification = Notifications(
                notificationID: item2.notificationID,
                sendDate: item2.sendDate,
                type: .email
            )
            notifications.append(notification)
        }
        
        return notifications.sorted(by: { $0.sendDate.compare($1.sendDate) == .orderedDescending } )
    }
}

extension NotificationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationsTableViewCell", for: indexPath) as! NotificationsTableViewCell
        cell.setup(notification: self.notifications[indexPath.row])
        
        return cell
    }
    
    
}
