//
//  ProfileTabsCollectionReusableView.swift
//  Instegram-Clone
//
//  Created by Tal Spektor on 24/11/2020.
//  Copyright © 2020 Tal Spektor. All rights reserved.
//

import UIKit

protocol ProfileTabsCollectionReusableViewDelegate: AnyObject {
    func didTapGridButtonTab()
    func didTapTaggedButtonTab()
}

class ProfileTabsCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileTabsCollectionReusableView"
    
    public weak var delegate: ProfileTabsCollectionReusableViewDelegate?
    
    struct Constants {
        static let paddong: CGFloat = 8
    }
    
    private let gridButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.tintColor = .systemBlue
        button.setBackgroundImage(UIImage(systemName: "square.grid.2x2"), for: .normal)
        return button
    }()
    
    private let taggedButton: UIButton = {
           let button = UIButton()
           button.clipsToBounds = true
           button.tintColor = .secondarySystemBackground
           button.setBackgroundImage(UIImage(systemName: "tag"), for: .normal)
           return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(taggedButton)
        addSubview(gridButton)
        
        gridButton.addTarget(self,
                             action: #selector(didTapGridButton),
                             for: .touchUpInside)
        taggedButton.addTarget(self,
                               action: #selector(didTaptaggedButton),
                               for: .touchUpInside)
    }
    
    @objc private func  didTapGridButton() {
        gridButton.tintColor = .systemBlue
        taggedButton.tintColor = .systemGray
        delegate?.didTapGridButtonTab()
    }
    
    @objc private func didTaptaggedButton() {
        taggedButton.tintColor = .systemBlue
        gridButton.tintColor = .systemGray
        delegate?.didTapTaggedButtonTab()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = height-(Constants.paddong * 2)
        let gridButtonX = ((width/2)-size)/2
        
        gridButton.frame = CGRect(x: gridButtonX,
                                  y: Constants.paddong,
                                  width: size,
                                  height: size)
        
        taggedButton.frame = CGRect(x: gridButtonX + (width/2) ,
                                    y: Constants.paddong,
                                    width: size,
                                    height: size)
    }
    
}
