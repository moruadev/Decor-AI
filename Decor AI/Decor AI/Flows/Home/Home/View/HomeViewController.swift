//
//  HomeViewController.swift
//  Decor AI
//
//  Created by Damir on 05.04.2023.
//

import UIKit
import Photos
import SnapKit

final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    var output: HomeViewOutput?
    
    // MARK: - Private Properties
    
    private var assets: PHFetchResult<PHAsset>?
    private let homeHeaderView = HomeHeaderView()
    private let galleryHeaderView = GalleryHeaderView()
    
    private lazy var stylesCollectionView: UICollectionView = {
        let layout = ZoomAndSnapFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private lazy var galleryContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .lightGray
        return view
    }()
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output?.viewLoaded()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}

// MARK: - HomeViewInput

extension HomeViewController: HomeViewInput {
    
    func setupInitialState() {
        configureBackground()
        configureNavigationBar()
    }
    
    func updateCollectionView(with assets: PHFetchResult<PHAsset>) {
        self.assets = assets
        collectionView.reloadData()
    }
}

// MARK: - Configuration

private extension HomeViewController {
    
    func configureBackground() {
        view.backgroundColor = ColorFactory.Main.background
    }
    
    func configureNavigationBar() {
        title = R.string.localizable.home()
    }
    
}

// MARK: - Actions

private extension HomeViewController {
    
    func setupViews() {
        setupHomeHeaderView()
        setupStylesCollectionView()
        setupContainerView()
    }
    
    func setupHomeHeaderView() {
        view.addSubview(homeHeaderView)
        
        homeHeaderView.snp.makeConstraints { make in
            make.topMargin.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
    }
    
    func setupStylesCollectionView() {
        stylesCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CellId")
        
        view.addSubview(stylesCollectionView)
        
        stylesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(homeHeaderView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(160)
        }
    }
    
    func setupContainerView() {
        view.addSubview(galleryContainerView)
        galleryContainerView.snp.makeConstraints { make in
            make.top.equalTo(stylesCollectionView.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        setupGalleryHeaderView()
        setupCollectionView()
    }
    
    func setupGalleryHeaderView() {
        galleryContainerView.addSubview(galleryHeaderView)
        galleryHeaderView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
    }
    
    func setupCollectionView() {
        collectionView.register(AssetCollectionViewCell.self,
                                forCellWithReuseIdentifier: "HomeAssetCollectionViewCell")
        
        galleryContainerView.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(galleryHeaderView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
    }
    
    @objc
    func updateButtonPressed() {
        output?.update()
    }
    
}

// MARK: - UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
    }
}

// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return assets?.count ?? 0
        } else if collectionView == stylesCollectionView {
            return 15
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            guard let asset = assets?.object(at: indexPath.item),
                  let image = UIImage.from(asset: asset) else {
                return UICollectionViewCell()
            }
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeAssetCollectionViewCell", for: indexPath) as! AssetCollectionViewCell
            cell.configureCell(with: image)
            return cell
        } else if collectionView == stylesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath)
            cell.backgroundColor = .purple
            return cell
        }
        
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewFlowLayout

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 16) / 3
        
        return CGSize(width: width, height: width)
    }
}


