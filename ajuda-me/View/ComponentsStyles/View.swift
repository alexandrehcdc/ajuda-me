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

public func setViewAsCard (view: UIView) -> UIView {
    view.clipsToBounds = true
    view.layer.cornerRadius = 10
    view.layer.maskedCorners = [.layerMinXMinYCorner,
                                .layerMaxXMinYCorner,
                                .layerMinXMaxYCorner,
                                .layerMaxXMaxYCorner]
    return view
}

public func setViewAsCard (view: UITextView) -> UITextView {
    view.clipsToBounds = true
    view.layer.cornerRadius = 10
    view.layer.maskedCorners = [.layerMinXMinYCorner,
                                .layerMaxXMinYCorner,
                                .layerMinXMaxYCorner,
                                .layerMaxXMaxYCorner]
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

public func setProfilePictureStyle (image: UIImageView) -> UIImageView {
    image.layer.masksToBounds = false
    image.layer.cornerRadius = image.frame.height/2
    image.clipsToBounds = true
    return image
}

public func setViewSimpleShadow(view: UIView, color: CGColor, opacity: Float = 0.5) -> UIView {
    view.layer.borderColor  =  color
    view.layer.borderWidth = 0.5
    view.layer.shadowOpacity = opacity
    view.layer.shadowColor =  color
    view.layer.shadowRadius = 5.0
    view.layer.shadowOffset = CGSize(width:5, height: 5)
    view.layer.masksToBounds = true
    return view
}
