//
//  THAlertMessageButton.swift
//
//  Created by 유태훈 on 2023/10/11.
//

import UIKit

public enum THAlertMessageButton {
    case submit(button: THAlertMessageButtonStyle, index: Int)
    case cancel(button: THAlertMessageButtonStyle)
    
    var name: String {
        switch self {
        case .submit(let button, _):
            return button.name
        case .cancel(let button):
            return button.name
        }
    }
    
    var font: UIFont {
        switch self {
        case .submit(let button, _):
            return button.font
        case .cancel(let button):
            return button.font
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .submit(let button, _):
            return button.textColor
        case .cancel(let button):
            return button.textColor
        }
    }
    
    var buttonColor: UIColor {
        switch self {
        case .submit(let button, _):
            return button.buttonColor
        case .cancel(let button):
            return button.buttonColor
        }
    }
}
