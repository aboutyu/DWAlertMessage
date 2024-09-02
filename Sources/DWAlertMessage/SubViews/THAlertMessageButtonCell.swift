//
//  THAlertMessageButtonCell.swift
//  idsTrustTestApp
//
//  Created by 유태훈 on 2023/10/12.
//

import UIKit

class THAlertMessageButtonCell: UICollectionViewCell {
    lazy var nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.textColor = .black
        return label
    }()
    
    private var button: THAlertMessageButton?
    var bgColor: UIColor?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func reload(_ button: THAlertMessageButton) {
        self.button = button
        
        [nameLabel].forEach { self.addSubview($0) }
        self.layer.cornerRadius = 10
        
        self.nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.nameLabel.text = button.name
        self.nameLabel.textColor = button.textColor
        self.nameLabel.font = button.font
        self.backgroundColor = button.buttonColor
        self.layer.borderColor = button.borderColor
    }
}
