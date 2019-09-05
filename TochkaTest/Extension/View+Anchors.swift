//
//  View+Anchors.swift
//  TochkaTest
//
//  Created by Dmitry Ilyinykh on 05/09/2019.
//  Copyright © 2019 Dmitry Ilyinykh. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func fillSuperview(_ view: UIView? = nil, padding: UIEdgeInsets = .zero) {
        
        let _superview = view == nil ? superview : view
        anchor(top: _superview?.topAnchor, leading: _superview?.leadingAnchor, bottom: _superview?.bottomAnchor, trailing: _superview?.trailingAnchor, padding: padding)
    }
    
    func anchorSize(to view: UIView) {
        
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                leading: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                trailing: NSLayoutXAxisAnchor? = nil,
                width: CGFloat? = nil,
                height: CGFloat? = nil,
                centerY: NSLayoutYAxisAnchor? = nil,
                centerX: NSLayoutXAxisAnchor? = nil,
                padding: UIEdgeInsets = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
    }
}
