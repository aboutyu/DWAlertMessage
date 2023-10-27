//
//  DWAlertMessage.swift
//
//  Created by 유태훈 on 2023/10/11.
//

import UIKit

public struct DWAlertMessageResult {
    public var buttonType: THAlertMessageButton
    public var data: Any?
    
    public init(_ buttonType: THAlertMessageButton, data: Any?) {
        self.buttonType = buttonType
        self.data = data
    }
}

public class DWAlertMessage {
    private var target: UIViewController
    private var dto: THAlertMessageDto
    public var action: ((DWAlertMessageResult) -> ())? = nil
    
    public init(_ target: UIViewController, data: THAlertMessageDto) {
        self.target = target
        self.dto = data
    }
    
    deinit {}
    
    public func show() {
        let alert = THAlertMessageViewController(self, dto: dto)
        self.target.present(alert, animated: true)
    }
}

extension DWAlertMessage: THAlertViewControllerDelegate {
    func tappedButtonPopupV2View(_ tapped: THAlertMessageButton, data: Any?) {
        guard let action = self.action else { return }
        action(DWAlertMessageResult(tapped, data: data))
    }
}

