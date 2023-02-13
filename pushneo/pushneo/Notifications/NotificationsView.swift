//
//  NotificationsView.swift
//  pushneo
//
//  Created by Lucas Hubert on 12/08/22.
//

import UIKit

class NotificationsView: UIView {
    
    var notificatonsTable: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.allowsSelection = false
        return tv
    }()
    
    var segmentedControlFilter: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Todos", "Web", "SMS", "Email"])
        sc.selectedSegmentIndex = 0
        sc.layer.cornerRadius = 8
        sc.backgroundColor = .systemBackground
        return sc
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
        addSubview(segmentedControlFilter)
        addSubview(notificatonsTable)
    }
    
    private func setupConstraints() {
        notificatonsTable.translatesAutoresizingMaskIntoConstraints = false
        segmentedControlFilter.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            segmentedControlFilter.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            segmentedControlFilter.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            segmentedControlFilter.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            notificatonsTable.topAnchor.constraint(equalTo: segmentedControlFilter.bottomAnchor, constant: 16),
            notificatonsTable.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            notificatonsTable.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            notificatonsTable.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        ])
    }
}
