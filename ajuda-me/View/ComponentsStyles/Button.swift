//
//  Button.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 6/6/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import Foundation
import UIKit

public func setMainButtonStyle (btn: UIButton) -> UIButton {
    btn.layer.cornerRadius = 20
    btn.clipsToBounds = true
    return btn
}
