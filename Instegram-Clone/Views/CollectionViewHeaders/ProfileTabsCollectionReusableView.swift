//
//  ProfileTabsCollectionReusableView.swift
//  Instegram-Clone
//
//  Created by Tal Spektor on 24/11/2020.
//  Copyright © 2020 Tal Spektor. All rights reserved.
//

import UIKit

class ProfileTabsCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileTabsCollectionReusableView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
