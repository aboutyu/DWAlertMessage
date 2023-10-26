//
//  THAlertMessageDto.swift
//  idsTrustTestApp
//
//  Created by 유태훈 on 2023/10/11.
//

import UIKit

public struct THAlertMessageDto {
    var messageType: THAlertMessageType
    var button: [THAlertMessageButton]
    var title: String?
    var message: NSAttributedString
    var data: Any?
    var submitColor: UIColor
    var cancelColor: UIColor
    
    public init(type: THAlertMessageType,
                button: [THAlertMessageButton],
                title: String? = nil,
                message: NSAttributedString,
                submitColor: UIColor,
                cancelColor: UIColor,
                data: Any? = nil) {
        self.messageType = type
        self.title = title
        self.message = message
        self.data = data
        self.submitColor = submitColor
        self.cancelColor = cancelColor
        
        self.button = {
            if button.isEmpty { return [THAlertMessageButton.cancel] }
            return button
        }()
    }
}
