//
//  EditProfileViewController.swift
//  Instegram-Clone
//
//  Created by Tal Spektor on 18/11/2020.
//  Copyright © 2020 Tal Spektor. All rights reserved.
//

import UIKit

struct EditProfileFormModel {
    let label: String
    let placeHolder: String
    var value: String?
}

final class EditProfileViewController: UIViewController, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FormTableViewCell.self,
                           forCellReuseIdentifier: FormTableViewCell.identifier)
        return tableView
    }()
    
    private var models = [[EditProfileFormModel]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        tableView.tableHeaderView = createTableViewHeader()
        view.addSubview(tableView)
        tableView.dataSource = self
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapSave))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(didTapCancel))
    }
    
    private func configureModels() {
        // name, username, website, bio
        let section1Labels = ["Name", "Username", "Bio"]
        var section1 = [EditProfileFormModel]()
        for label in section1Labels {
            let model = EditProfileFormModel(label: label, placeHolder: "Enter \(label)", value: nil)
            section1.append(model)
        }
        models.append(section1)
        
        // email, phone, gender
        let section2Labels = ["Email", "Phone", "Gender"]
        var section2 = [EditProfileFormModel]()
        for label in section2Labels {
            let model = EditProfileFormModel(label: label, placeHolder: "Enter \(label)", value: nil)
            section2.append(model)
        }
        models.append(section2)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    // MARK: - TableView
    
    private func createTableViewHeader() -> UIView{
        let header = UIView(frame: CGRect(x: 0,
                                          y: 0,
                                          width: view.width,
                                          height: view.height/4).integral)
        let size = header.height/1.5
        let profilerPhotoButton = UIButton(frame: CGRect(x: (view.width-size)/2,
                                                         y: (header.height-size)/2,
                                                         width: size,
                                                         height: size))
        header.addSubview(profilerPhotoButton)
        profilerPhotoButton.layer.masksToBounds = true
        profilerPhotoButton.layer.cornerRadius = size/2
        profilerPhotoButton.tintColor = .label
        profilerPhotoButton.addTarget(self,
                                      action: #selector(didTapProfilePhotoButton),
                                      for: .touchUpInside)
        profilerPhotoButton.setBackgroundImage(UIImage(systemName: "person.circle"),
                                               for: .normal)
        profilerPhotoButton.layer.borderWidth = 1
        profilerPhotoButton.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        return header
    }
    
    @objc private func didTapProfilePhotoButton() {
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: FormTableViewCell.identifier,
                                                 for: indexPath) as! FormTableViewCell
        cell.configure(with: model)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeader section: Int) -> String? {
        guard section == 1 else { return nil }
        return "Private Information"
    }
    
    // MARK: - Action
    
    @objc private func didTapSave() {
        // save info database
        dismiss(animated: true)
    }
    
    @objc private func didTapCancel() {
        dismiss(animated: true)
    }
    
    @objc private func didTapChangeProfilePicture() {
        let actionSheet = UIAlertController(title: "Profile Picture",
                                            message: "Change Profile Picture",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Take Photo",style: .default) { _ in
                                                
        })
        actionSheet.addAction(UIAlertAction(title: "Choose from Library",style: .default) { _ in
                                                
        })
        actionSheet.addAction(UIAlertAction(title: "Cancel",style: .cancel))
        
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        
        present(actionSheet, animated: true)
    }
}

extension EditProfileViewController: FormTableViewCellDelegate {
    func formTableViewCell(_ cell: FormTableViewCell, didUpdateField updatedModel: EditProfileFormModel) {
        // Update the model
        print(updatedModel.value ?? "nil")
    }
    
    
}
