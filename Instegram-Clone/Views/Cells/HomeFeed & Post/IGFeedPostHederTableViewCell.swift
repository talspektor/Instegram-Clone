//
//  IGFeedPostHederTableViewCell.swift
//  Instegram-Clone
//
//  Created by Tal Spektor on 23/11/2020.
//  Copyright © 2020 Tal Spektor. All rights reserved.
//

import UIKit
import SDWebImage

protocol IGFeedPostHederTableViewCellDelegate: AnyObject {
    func didTapMoreButton()
}

class IGFeedPostHederTableViewCell: UITableViewCell {

    static let identifier = "IGFeedPostHederTableViewCell"
    
    weak var delegate: IGFeedPostHederTableViewCellDelegate?
    
    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let usernbameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private let moreButton: UIButton = {
        let button = UIButton()
        button.tintColor = .label
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(profilePhotoImageView)
        contentView.addSubview(usernbameLabel)
        contentView.addSubview(moreButton)
        moreButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton() {
        delegate?.didTapMoreButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: User) {
        usernbameLabel.text = model.username
        profilePhotoImageView.image = UIImage(systemName: "person.circle")
//        profilePhotoImageView.sd_setImage(with: model.profilPhoto, completed: nil)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size = contentView.height - 4
        profilePhotoImageView.frame = CGRect(x: 2, y: 2, width: size, height: size)
        profilePhotoImageView.layer.cornerRadius = size/2
        
        moreButton.frame = CGRect(x: contentView.width-size, y: 2, width: size, height: size)
        usernbameLabel.frame = CGRect(
            x: profilePhotoImageView.right+10,
            y: 2,
            width: contentView.width-(size*2)-15,
            height: contentView.height-4
        )
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        usernbameLabel.text = ""
        profilePhotoImageView.image = nil
    }
}
