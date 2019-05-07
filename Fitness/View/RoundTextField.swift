//
//  RoundTextField.swift
//  DoctorAdvisor
//
//  Created by Bodgar Jair Espinosa Miranda on 25/05/18.
//  Copyright © 2018 Bodgar Jair Espinosa Miranda. All rights reserved.
//

import UIKit

@IBDesignable
class RoundTextField: UITextField {

    @IBInspectable var cornerRadius : CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = (cornerRadius > 0)
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor : UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var placeHolderColor: UIColor? {
        didSet {
            let rawString = attributedPlaceholder?.string != nil ? attributedPlaceholder?.string : ""
            let att = NSAttributedString(string: rawString!, attributes: [.foregroundColor: placeHolderColor!])
            attributedPlaceholder = att
        }
    }

}
