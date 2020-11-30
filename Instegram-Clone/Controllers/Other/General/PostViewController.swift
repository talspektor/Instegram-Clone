//
//  PostViewController.swift
//  Instegram-Clone
//
//  Created by Tal Spektor on 18/11/2020.
//  Copyright © 2020 Tal Spektor. All rights reserved.
//

import UIKit

/*
 Section
 - Header model
 Section
 - Post cell model
 Section
 - Action button cell model
 Section
 - n number of General models for comments
 */

/// States of a renderd cell
enum PostRenderType {
    case header(provider: User)
    case primaryContent(provider: UserPost) // post
    case actions(provider: String) // like, comment, share
    case comments(comments: [PostComment])
}

/// Model od renderd posts
struct PostRenderViewModel {
    let renderType: PostRenderType
}

final class PostViewController: UIViewController {
    
    private let model: UserPost?
    
    private var renderdModels = [PostRenderViewModel]()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        // Register cells
        tableView.register(IGFeedPostTableViewCell.self,
                           forCellReuseIdentifier: IGFeedPostTableViewCell.identifier)
        tableView.register(IGFeedPostHederTableViewCell.self,
                           forCellReuseIdentifier: IGFeedPostHederTableViewCell.identifier)
        tableView.register(IGFeedPostActionsTableViewCell.self,
                           forCellReuseIdentifier: IGFeedPostActionsTableViewCell.identifier)
        tableView.register(IGFeedPostGeneralTableViewCell.self,
                           forCellReuseIdentifier: IGFeedPostGeneralTableViewCell.identifier)
        return tableView
    }()
    
    // MARK: - Init
    
    init(model: UserPost?) {
        
        self.model = model
        super.init(nibName: nil, bundle: nil)
        cunfigureModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func cunfigureModel() {
        guard let userPostModel = self.model else { return }
        // Header
        renderdModels.append(PostRenderViewModel(renderType: .header(provider: userPostModel.owner)))
        // Posets
        renderdModels.append(PostRenderViewModel(renderType: .primaryContent(provider: userPostModel)))
        // Actions
        renderdModels.append(PostRenderViewModel(renderType: .actions(provider: "")))
        // 4 Comments
        var comments = [PostComment]()
        for x in 0..<4 {
            comments.append(
                PostComment(identifier: "123_\(x)",
                    username: "@Dave",
                    test: "Great Post",
                    createdDate: Date(),
                    likes: []
                )
            )
        }
        renderdModels.append(PostRenderViewModel(renderType: .comments(comments: comments)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return renderdModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch renderdModels[section].renderType {
        case .actions(_): return 1
        case .comments(let comments): return comments.count > 4 ? 4 : comments.count
        case .primaryContent(_): return 1
        case .header(_): return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = renderdModels[indexPath.section]
        switch model.renderType {
        case .actions(let action):
            let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostActionsTableViewCell.identifier,
                                                     for: indexPath) as! IGFeedPostActionsTableViewCell
            return cell
            
        case .comments(let comments):
            let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostGeneralTableViewCell.identifier,
                                                     for: indexPath) as! IGFeedPostGeneralTableViewCell
            return cell
            
        case .primaryContent(let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostTableViewCell.identifier,
                                                     for: indexPath) as! IGFeedPostTableViewCell
            return cell
            
        case .header(let header):
            let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostHederTableViewCell.identifier,
                                                     for: indexPath) as! IGFeedPostHederTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = renderdModels[indexPath.section]
        switch model.renderType {
        case .actions(_): return 60
            
        case .comments(_): return 50
            
        case .primaryContent(_): return tableView.width
            
        case .header(_): return 70
            
        }
    }
}
