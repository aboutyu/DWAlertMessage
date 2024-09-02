//
//  THAlertMessageDto.swift
//  idsTrustTestApp
//
//  Created by 유태훈 on 2023/10/11.
//

import UIKit

public struct THAlertMessageDto {
    var messageType: THAlertMessageType
    var title: THAlertMessageTitleStyle?
    var message: NSAttributedString
    var button: [THAlertMessageButton]
    var buttonHeight: CGFloat
    var data: Any?
    
    public init(type: THAlertMessageType,
                title: THAlertMessageTitleStyle? = nil,
                message: NSAttributedString,
                button: [THAlertMessageButton],
                buttonHeight: CGFloat = 46.0,
                data: Any? = nil) {
        self.messageType = type
        self.title = title
        self.message = message
        self.buttonHeight = buttonHeight
        self.data = data
        
        self.button = {
            if button.isEmpty {
                let cancel = THAlertMessageButtonStyle(name: "취소", 
                                                       font: .systemFont(ofSize: 16),
                                                       textColor: .white,
                                                       buttonColor: .gray)
                return [THAlertMessageButton.cancel(button: cancel)]
            }
            return button
        }()
    }
}
