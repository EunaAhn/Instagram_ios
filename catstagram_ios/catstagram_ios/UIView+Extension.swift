//
//  UIView+Extension.swift
//  catstagram_ios
//
//  Created by Euna Ahn on 2022/04/08.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat{
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
