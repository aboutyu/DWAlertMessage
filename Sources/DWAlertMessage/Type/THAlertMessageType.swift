//
//  THAlertMessageType.swift
//
//  Created by 유태훈 on 2023/10/11.
//

import UIKit

public enum THAlertMessageType {
    case pill
    case exclamation
    case downloadFile
    case custom(icon: UIImage)
    case none
    
    var icon: UIImage? {
        switch self {
        case .pill:
            return UIImage(named: "ic_popup_pill", in: Bundle.module, compatibleWith: nil)
        case .exclamation:
            return UIImage(named: "ic_popup_exclamation", in: Bundle.module, compatibleWith: nil)
        case .downloadFile:
            return UIImage(named: "ic_popup_file_download", in: Bundle.module, compatibleWith: nil)
        case .custom(let icon):
            return icon
        case .none:
            return nil
        }
    }
    
    var isHiddenArea: Bool {
        switch self {
        case .pill, .exclamation, .downloadFile, .custom(_):
            return false
        case .none:
            return true
        }
    }
}

