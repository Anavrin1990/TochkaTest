//
//  ViewController.swift
//  TochkaTest
//
//  Created by Dmitry Ilyinykh on 04/09/2019.
//  Copyright © 2019 Dmitry Ilyinykh. All rights reserved.
//

import UIKit

class MainViewController: BindableViewController<MainViewModelType> {
    
    var tableView: MyTableView = {
        return MyTableView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        view.addSubview(tableView)
        tableView.fillSuperview(view)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: viewModel.cellID)
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        viewModel.sightsArray
            .bind { [weak self] _ in
                self?.tableView.reloadData()
        }        
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.sightsArray.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellID, for: indexPath) as! MyTableViewCell
        cell.bind(to: viewModel.getMyCellViewModel(at: indexPath))
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let visibleHeight = scrollView.frame.height - scrollView.contentInset.top - scrollView.contentInset.bottom
        let y = scrollView.contentOffset.y + scrollView.contentInset.top
        let threshold = scrollView.contentSize.height - visibleHeight - 300
        
        if y >= threshold, !viewModel.stopPagination {
            viewModel.loadMore()
        }
    }
}
