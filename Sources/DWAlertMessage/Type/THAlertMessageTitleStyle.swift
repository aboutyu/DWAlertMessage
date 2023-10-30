//
//  THAlertMessageTitleStyle.swift
//
//
//  Created by 유태훈 on 10/30/23.
//

import UIKit

public struct THAlertMessageTitleStyle {
    var name: String
    var font: UIFont
    var textColor: UIColor
    
    public init(name: String, font: UIFont, textColor: UIColor) {
        self.name = name
        self.font = font
        self.textColor = textColor
    }
}
