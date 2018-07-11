//
//  View.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 7/8/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import Foundation
import UIKit

public func setViewUpperRoundCorners (view: UIView) -> UIView {
    view.clipsToBounds = true
    view.layer.cornerRadius = 10
    view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    return view
}

public func setViewUpperRoundCorners (view: UITextView) -> UITextView {
    view.clipsToBounds = true
    view.layer.cornerRadius = 10
    view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    return view
}

public func setViewCardShadows (view: UIView) -> UIView {
    view.layer.cornerRadius = 5.0
    view.layer.borderColor  =  UIColor.lightGray.cgColor
    view.layer.borderWidth = 0.4
    view.layer.shadowOpacity = 0.5
    view.layer.shadowColor =  UIColor.lightGray.cgColor
    view.layer.shadowRadius = 5.0
    view.layer.shadowOffset = CGSize(width:5, height: 5)
    view.layer.masksToBounds = true
    view.backgroundColor = UIColor.white
    return view
}
