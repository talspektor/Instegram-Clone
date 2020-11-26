//
//  NotificationLikeEventTableViewCell.swift
//  Instegram-Clone
//
//  Created by Tal Spektor on 26/11/2020.
//  Copyright © 2020 Tal Spektor. All rights reserved.
//

import UIKit

protocol NotificationLikeEventTableViewCellDelegate: AnyObject {
    func didTapollowUnFollowutton(model: String)
}

class NotificationLikeEventTableViewCell: UITableViewCell {
    static let identifier = "NotificationLikeEventTableViewCell"
    
    public weak var delegate: NotificationLikeEventTableViewCellDelegate?
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView
            .contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    private let postButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.addSubview(label)
        contentView.addSubview(profileImageView)
        contentView.addSubview(postButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with nodel: String) {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        postButton.setTitle(nil, for: .normal)
        postButton.backgroundColor = nil
        postButton.layer.borderWidth = 0
        label.text = nil
        profileImageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
