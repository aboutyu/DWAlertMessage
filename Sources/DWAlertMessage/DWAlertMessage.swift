//
//  DWAlertMessage.swift
//
//  Created by 유태훈 on 2023/10/11.
//

import UIKit

public class DWAlertMessage {
    private var target: UIViewController
    private var dto: THAlertMessageDto
    public var action: ((THAlertMessageButton, Any?) -> ())? = nil
    
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
        action(tapped, data)
    }
}

