//
//  DWAlertMessageResult.swift
//
//
//  Created by 유태훈 on 10/27/23.
//

import Foundation

public struct DWAlertMessageResult {
    private var type: THAlertMessageButton
    private var model: Any?
    
    public init(_ buttonType: THAlertMessageButton, data: Any?) {
        self.type = buttonType
        self.model = data
    }
    
    func buttonType() -> THAlertMessageButton {
        return type
    }
    
    func data() -> Any? {
        return model
    }
}
