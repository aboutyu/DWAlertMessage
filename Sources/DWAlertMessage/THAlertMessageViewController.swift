//
//  THAlertMessageViewController.swift
//
//  Created by 유태훈 on 2023/10/11.
//

import UIKit

protocol THAlertViewControllerDelegate {
    func tappedButtonPopupV2View(_ tapped: THAlertMessageButton, data: Any?)
}

class THAlertMessageViewController: UIViewController {
    private lazy var popup: UIView = {
        let popup = UIView()
        popup.translatesAutoresizingMaskIntoConstraints = false
        popup.backgroundColor = .white
        popup.layer.cornerRadius = 10.0
        
        return popup
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isHidden = self.dto.messageType.isHiddenArea
        image.image = self.dto.messageType.icon
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 0
        
        let title = self.dto.title
        label.text = title?.name
        label.font = title?.font
        label.textColor = title?.textColor
        return label
    }()
    
    private lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 0
        label.attributedText = self.dto.message
        
        return label
    }()
    
    private lazy var labelStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 16
        
        return stackView
    }()
    
    private lazy var buttonStack: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let buttonStack = UICollectionView(frame: .zero, collectionViewLayout: layout)
        buttonStack.backgroundColor = .clear
        buttonStack.register(THAlertMessageButtonCell.self, forCellWithReuseIdentifier: "cell")
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.showsVerticalScrollIndicator = false
        buttonStack.showsHorizontalScrollIndicator = false
        buttonStack.isScrollEnabled = false
        
        return buttonStack
    }()
     
    private var delegate: THAlertViewControllerDelegate
    private var dto: THAlertMessageDto
    private let popupSideMargin: CGFloat = 26.0
    private let imageSize: CGFloat = 48.0
    private let buttonHeigh: CGFloat = 46.0
    
    init(_ delegate: THAlertViewControllerDelegate, dto: THAlertMessageDto) {
        self.delegate = delegate
        self.dto = dto
        
        super.init(nibName: nil, bundle: nil)
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSubViews()
        self.setupLayout()
    }
    
    private func setupSubViews() {
        [self.popup].forEach { self.view.addSubview($0) }
        
        {
            if let _ = self.dto.title {
                return [self.titleLabel, self.bodyLabel]
            }
            return [self.bodyLabel]
        }().forEach { self.labelStack.addArrangedSubview($0) }
        
        [self.image, self.labelStack, self.buttonStack].forEach { self.popup.addSubview($0) }
    }
    
    private func setupLayout() {
        self.view.backgroundColor = .black.withAlphaComponent(0.5)
        self.buttonStack.delegate = self
        self.buttonStack.dataSource = self
        
        self.popup.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.popup.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.popup.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.popup.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        
        if !(self.dto.messageType.isHiddenArea) {
            self.image.centerXAnchor.constraint(equalTo: self.popup.centerXAnchor).isActive = true
            self.image.widthAnchor.constraint(equalToConstant: self.imageSize).isActive = true
            self.image.heightAnchor.constraint(equalToConstant: self.imageSize).isActive = true
            self.image.topAnchor.constraint(equalTo: self.popup.topAnchor, constant: 24).isActive = true
            self.image.bottomAnchor.constraint(equalTo: self.labelStack.topAnchor, constant: -24).isActive = true
        } else {
            self.labelStack.topAnchor.constraint(equalTo: self.popup.topAnchor, constant: 24).isActive = true
        }
        
        self.labelStack.leadingAnchor.constraint(equalTo: self.popup.leadingAnchor, constant: self.popupSideMargin).isActive = true
        self.labelStack.trailingAnchor.constraint(equalTo: self.popup.trailingAnchor, constant: -self.popupSideMargin).isActive = true
        self.labelStack.bottomAnchor.constraint(equalTo: self.buttonStack.topAnchor, constant: -16).isActive = true
        
        self.buttonStack.leadingAnchor.constraint(equalTo: self.popup.leadingAnchor, constant: self.popupSideMargin).isActive = true
        self.buttonStack.trailingAnchor.constraint(equalTo: self.popup.trailingAnchor, constant: -self.popupSideMargin).isActive = true
        self.buttonStack.bottomAnchor.constraint(equalTo: self.popup.bottomAnchor, constant: -16).isActive = true
        self.buttonStack.heightAnchor.constraint(equalToConstant: self.buttonHeigh).isActive = true
    }
}

extension THAlertMessageViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let popupWidth = self.popup.frame.size.width
        let cnt = CGFloat(self.dto.button.count)
        let width: CGFloat = ((popupWidth - (self.popupSideMargin * 2.0)) / cnt) - ((cnt - 1) + 5)
        return CGSize(width: width, height: self.buttonHeigh)
    }
}

extension THAlertMessageViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dto.button.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! THAlertMessageButtonCell
        cell.reload(self.dto.button[indexPath.row])
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.dismiss(animated: true) {
            self.delegate.tappedButtonPopupV2View(self.dto.button[indexPath.row], data: self.dto.data)
        }
    }
}
