//
//  THAlertMessageType.swift
//
//  Created by 유태훈 on 2023/10/11.
//

import UIKit

public enum THAlertMessageType {
    case pill
    case exclamation
    case custom(icon: UIImage)
    
    var icon: UIImage {
        switch self {
        case .pill:
            return UIImage(named: "ic_popup_pill")!
        case .exclamation:
            return UIImage(named: "ic_popup_exclamation")!
        case .custom(let icon):
            return icon
        }
    }
    
}

