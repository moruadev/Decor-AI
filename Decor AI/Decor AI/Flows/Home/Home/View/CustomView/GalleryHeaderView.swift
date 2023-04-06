//
//  GalleryHeaderView.swift
//  Decor AI
//
//  Created by Damir on 06.04.2023.
//

import UIKit
import SnapKit

final class GalleryHeaderView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Все фотографии"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private lazy var showGalleryButton: UIButton = {
        let button = UIButton()
        button.setTitle("Открыть галерею", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 8
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
        stackView.distribution = .fillEqually
        
        
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(showGalleryButton)
    }
}
