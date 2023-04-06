//
//  HomeHeaderView.swift
//  Decor AI
//
//  Created by Damir on 05.04.2023.
//

import UIKit
import SnapKit

final class HomeHeaderView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Decor AI"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .black
        return label
    }()
    
    private lazy var purchaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("Pro", for: .normal)
        button.backgroundColor = .systemPink
        return button
    }()
    
    private lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "gear"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 8
        
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        purchaseButton.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(40)
        }
        
        settingsButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
        
//        stackView.addArrangedSubview([titleLabel, purchaseButton, settingsButton])
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(purchaseButton)
        stackView.addArrangedSubview(settingsButton)
    }
}
