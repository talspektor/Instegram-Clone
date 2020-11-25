//
//  ProphileIndoCollectionReusableView.swift
//  Instegram-Clone
//
//  Created by Tal Spektor on 24/11/2020.
//  Copyright © 2020 Tal Spektor. All rights reserved.
//

import UIKit

protocol ProfileInfoCollectionReusableViewDelegate: AnyObject {
    func profileHeaderDidTapPostButton(_ header: ProfileInfoCollectionReusableView)
    func profileHeaderDidTapFollwerdButton(_ header: ProfileInfoCollectionReusableView)
    func profileHeaderDidTapFollowingButton(_ header: ProfileInfoCollectionReusableView)
    func profileHeaderDidTapEditProfileButton(_ header: ProfileInfoCollectionReusableView)
}

final class ProfileInfoCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileInfoCollectionReusableView"
    
    public weak var delegate: ProfileInfoCollectionReusableViewDelegate?
    
    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let postsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Posts", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let followingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Following", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let followersButton: UIButton = {
        let button = UIButton()
        button.setTitle("Follower", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let editProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit your profile", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Joe Smith"
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "This is the first account!"
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addButtonActions()
        backgroundColor = .systemBackground
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(profilePhotoImageView)
        addSubview(postsButton)
        addSubview(followingButton)
        addSubview(followersButton)
        addSubview(nameLabel)
        addSubview(bioLabel)
        addSubview(editProfileButton)
    }
    
    private func addButtonActions() {
        followersButton.addTarget(self, action: #selector(didTapFollowesrButton),
                                  for: .touchUpInside)
        followingButton.addTarget(self, action: #selector(didTapFollowingButton),
                                  for: .touchUpInside)
        postsButton.addTarget(self, action: #selector(didTapPostButton),
                                  for: .touchUpInside)
        editProfileButton.addTarget(self, action: #selector(didTapEditButton),
                                  for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let profilePhotoSize = width/4
        profilePhotoImageView.frame = CGRect(
            x: 5,
            y: 5,
            width: profilePhotoSize,
            height: profilePhotoSize
        ).integral
        
        profilePhotoImageView.layer.cornerRadius = profilePhotoSize/2.0
        
        let buttonHeight = profilePhotoSize/2
        let countButtonWidth = (width-10-profilePhotoSize)/3.0
        
        postsButton.frame = CGRect(
            x: profilePhotoImageView.right,
            y: 5,
            width: countButtonWidth,
            height: buttonHeight
        ).integral
        
        followersButton.frame = CGRect(
            x: postsButton.right,
            y: 5,
            width: countButtonWidth,
            height: buttonHeight
        ).integral
        
        followingButton.frame = CGRect(
            x: followersButton.right,
            y: 5,
            width: countButtonWidth,
            height: buttonHeight
        ).integral
        
        editProfileButton.frame = CGRect(
            x: profilePhotoImageView.right,
            y: 5 + buttonHeight,
            width: countButtonWidth*3,
            height: buttonHeight
        ).integral
        
        nameLabel.frame = CGRect(
            x: 5,
            y: 5 + profilePhotoImageView.bottom,
            width: width-10,
            height: 50
        ).integral
        
        let bioLabelSize = bioLabel.sizeThatFits(frame.size)
        
        bioLabel.frame = CGRect(
            x: 5,
            y: 5 + nameLabel.bottom,
            width: width-10,
            height: bioLabelSize.height
        ).integral
    }
    
    // MARK: - Actions
    
    @objc private func didTapFollowesrButton() {
        delegate?.profileHeaderDidTapFollwerdButton(self)
    }
    
    @objc private func didTapFollowingButton() {
        delegate?.profileHeaderDidTapFollowingButton(self)
    }
    
    @objc private func didTapPostButton() {
        delegate?.profileHeaderDidTapPostButton(self)
    }
    
    @objc private func didTapEditButton() {
        delegate?.profileHeaderDidTapEditProfileButton(self)
    }
    
}
