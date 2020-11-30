//
//  IGFeedPostActionsTableViewCell.swift
//  Instegram-Clone
//
//  Created by Tal Spektor on 23/11/2020.
//  Copyright © 2020 Tal Spektor. All rights reserved.
//

import UIKit

class IGFeedPostActionsTableViewCell: UITableViewCell {

    static let identifier = "IGFeedPostActionsTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemGreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        // configure the cell
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
