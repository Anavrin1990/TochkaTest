//
//  MyTableViewCell.swift
//  TochkaTest
//
//  Created by Dmitry Ilyinykh on 05/09/2019.
//  Copyright © 2019 Dmitry Ilyinykh. All rights reserved.
//

import UIKit

class MyTableViewCell: BindableTableViewCell<MyCellViewModelType> {

    var previewImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = #imageLiteral(resourceName: "defaultImage")
        imageView.cornerRadius = 25
        imageView.maskToBounds = true
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    var descrLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 3
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(previewImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descrLabel)
        
        previewImageView.anchor(leading: contentView.leadingAnchor, width: 50, height: 50, centerY: contentView.centerYAnchor, padding: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0))
        
        titleLabel.anchor(top: contentView.topAnchor, leading: previewImageView.trailingAnchor, bottom: descrLabel.topAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 5, left: 15, bottom: 10, right: 15))
        
        descrLabel.anchor(leading: previewImageView.trailingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 15, bottom: 5, right: 15))        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        viewModel.title
            .bind { [weak self] title in
                self?.titleLabel.text = title
        }
        viewModel.descr
            .bind { [weak self] title in
                self?.descrLabel.text = title
        }
        viewModel.previewImage
            .bind { [weak self] image in
                self?.previewImageView.image = image
        }
    }
}
