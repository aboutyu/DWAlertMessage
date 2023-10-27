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
    var titleFont: UIFont
    var buttonFont: UIFont
    var submitColor: UIColor
    var cancelColor: UIColor
    var buttonTextColor: UIColor
    
    public init(type: THAlertMessageType,
                button: [THAlertMessageButton],
                title: String? = nil,
                message: NSAttributedString,
                titleFont: UIFont = .systemFont(ofSize: 17),
                buttonFont: UIFont = .systemFont(ofSize: 15),
                buttonTextColor: UIColor = .white,
                submitColor: UIColor,
                cancelColor: UIColor,
                data: Any? = nil) {
        self.messageType = type
        self.title = title
        self.message = message
        self.data = data
        self.titleFont = titleFont
        self.submitColor = submitColor
        self.cancelColor = cancelColor
        self.buttonFont = buttonFont
        self.buttonTextColor = buttonTextColor
        
        self.button = {
            if button.isEmpty { return [THAlertMessageButton.cancel] }
            return button
        }()
    }
}
