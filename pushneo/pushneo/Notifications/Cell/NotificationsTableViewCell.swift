//
//  NotificationsTableViewCell.swift
//  pushneo
//
//  Created by Lucas Hubert on 12/08/22.
//

import UIKit

class NotificationsTableViewCell: UITableViewCell {
    
    private let cellView: UIView = {
        let v = UIView()
        v.backgroundColor = .systemGray5
        v.layer.cornerRadius = 8
        v.layer.shadowOffset = CGSize(width: 1, height: 1)
        v.layer.shadowColor = UIColor.systemGray6.cgColor
        return v
    }()
    
    private let iconView: UIImageView = {
        let icon = UIImageView()
        return icon
    }()
    
    private let titleLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 16, weight: .semibold)
        return l
    }()
    
    private var dateLabel: UILabel = {
        let l = UILabel()
        l.numberOfLines = 1
        l.font = .systemFont(ofSize: 14, weight: .semibold)
        return l
    }()
    
    private var identifierLabel: UILabel = {
        let l = UILabel()
        l.numberOfLines = 1
        l.font = .systemFont(ofSize: 14, weight: .light)
        return l
    }()

    
    // MARK: Initalizers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: Custom methods
    func setup(notification: Notifications) {
        self.dateLabel.text = formatDate(date: notification.sendDate)
        self.identifierLabel.text = String("#\(notification.notificationID)")
        
        switch notification.type {
            case .email:
                iconView.image = UIImage(systemName: "envelope")
                iconView.tintColor = .systemPurple
                titleLabel.text = "Email Push"
            case .web:
                iconView.image = UIImage(systemName: "network")
                iconView.tintColor = .systemYellow
                titleLabel.text = "Web Push"
            case .sms:
                iconView.image = UIImage(systemName: "message")
                iconView.tintColor = .systemRed
                titleLabel.text = "SMS"
        }
        
        buildViewHierarchy()
        setupConstraints()
    }
    
    private func formatDate(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SZZZZZ"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd/MM/yyyy - HH:mm:ss"
        return dateFormatter.string(from: date!)
    }
    
    private func buildViewHierarchy() {
        [
            cellView,
            iconView,
            dateLabel,
            titleLabel,
            identifierLabel].forEach { contentView.addSubview($0) }
    }
    
    private func setupConstraints() {
        [
            cellView,
            iconView,
            dateLabel,
            titleLabel,
            identifierLabel].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            iconView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 16),
            iconView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            iconView.heightAnchor.constraint(equalToConstant: 28),
            iconView.widthAnchor.constraint(equalToConstant: 28),
            
            titleLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -16),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 16),
            dateLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -16),
            
            identifierLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 16),
            identifierLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -16),
            identifierLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -16)
        ])
    }

}
