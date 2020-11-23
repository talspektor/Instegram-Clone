//
//  ExproreViewController.swift
//  Instegram-Clone
//
//  Created by Tal Spektor on 18/11/2020.
//  Copyright © 2020 Tal Spektor. All rights reserved.
//

import UIKit

class ExproreViewController: UIViewController {

    private let searchBar: UISearchBar = {
        let searchBare = UISearchBar()
        searchBare.backgroundColor = .secondarySystemBackground
        return searchBare
    }()
    
    private var collectioView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.topItem?.titleView = searchBar
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectioView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectioView?.delegate = self
        collectioView?.dataSource = self
        guard let collectioView = collectioView else { return }
        view.addSubview(collectioView)
    }
}

extension ExproreViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
