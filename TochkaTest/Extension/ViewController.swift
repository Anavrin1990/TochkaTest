//
//  ViewController.swift
//  TochkaTest
//
//  Created by Dmitry Ilyinykh on 05/09/2019.
//  Copyright © 2019 Dmitry Ilyinykh. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func withNavigationController(title: String? = nil, image: UIImage? = nil) -> UINavigationController {
        
        let navigationController = UINavigationController(rootViewController: self)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        self.title = title
        return navigationController
    }
}
