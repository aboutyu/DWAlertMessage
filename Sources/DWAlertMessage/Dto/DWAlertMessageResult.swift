//
//  DWAlertMessageResult.swift
//
//
//  Created by 유태훈 on 10/27/23.
//

import Foundation

public struct DWAlertMessageResult {
    private var buttonType: THAlertMessageButton
    private var data: Any?
    
    public init(_ buttonType: THAlertMessageButton, data: Any?) {
        self.buttonType = buttonType
        self.data = data
    }
    
    public func result() -> (buttonType: THAlertMessageButton, data: Any?) {
        return (buttonType, data)
    }
}
