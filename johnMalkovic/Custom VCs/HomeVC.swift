//
//  PhotoTakeVC.swift
//  johnMalkovic
//
//  Created by Marina Beatriz Santana de Aguiar on 26.10.20.
//

import UIKit

class HomeVC: UIViewController {
    var photo: UIImage!
    var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func configure() {
        guard let photo = photo else { return }
        let photoView = UIImageView(image: photo)
        photoView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(photoView)
        photoView.adjustsImageSizeForAccessibilityContentSizeCategory = true
        photoView.layer.borderColor = UIColor.label.cgColor
        photoView.layer.borderWidth = 1.5
        photoView.layer.cornerRadius = 5
        
        let shareButton = UIButton()
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(shareButton)
        //MARK: Does that work?
        shareButton.setBackgroundImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        shareButton.setBackgroundImage(UIImage(systemName: "square.and.arrow.up")?.withTintColor(.systemBlue), for: .highlighted)
        shareButton.addTarget(self, action: #selector(shareImage), for: .touchUpInside)
        
        setupCollectionView()
        
        NSLayoutConstraint.activate([
            shareButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            shareButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            shareButton.heightAnchor.constraint(equalToConstant: 45),
            shareButton.widthAnchor.constraint(equalTo: shareButton.heightAnchor),
            
            photoView.topAnchor.constraint(equalTo: shareButton.bottomAnchor, constant: 25),
            photoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            photoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            photoView.heightAnchor.constraint(equalToConstant: 450),
            
            collection.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 10),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            // collection needs a height anchor (if it contains subviews)
            collection.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    private func setupCollectionView() {
        let images = [UIImage(systemName: "heart")!, UIImage(systemName: "star.fill")!.withTintColor(.label), UIImage(systemName: "bolt.fill")!.withTintColor(.label),UIImage(systemName: "heart.fill")!.withTintColor(.label), UIImage(systemName: "star.fill")!.withTintColor(.white), UIImage(systemName: "bolt.fill")!.withTintColor(.label)]
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 20
        flowLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        collection = DefaultPicturesCollections(frame: .zero, collectionViewLayout: flowLayout, images: images)
        collection.register(PictureCell.self, forCellWithReuseIdentifier: PictureCell.reuseID)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .none
        view.addSubview(collection)
    }
    
    
    @objc
    private func shareImage() {
        // show modal
        //showDetailViewController(, sender: self)
    }
    
}
