//
//  THAlertMessageButtonStyle.swift
//
//
//  Created by 유태훈 on 10/30/23.
//

import UIKit

public struct THAlertMessageButtonStyle {
    var name: String
    var font: UIFont
    var textColor: UIColor
    var buttonColor: UIColor
    var borderColor: UIColor
    
    public init(name: String, font: UIFont, textColor: UIColor, buttonColor: UIColor, borderColor: UIColor = .clear) {
        self.name = name
        self.font = font
        self.textColor = textColor
        self.buttonColor = buttonColor
        self.borderColor = borderColor
    }
}
