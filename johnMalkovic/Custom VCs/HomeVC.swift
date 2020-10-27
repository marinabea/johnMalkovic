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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, photo: UIImage) {
        self.photo = photo
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
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
        shareButton.setBackgroundImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        shareButton.tintColor = .label
        shareButton.addTarget(self, action: #selector(shareImage), for: .touchUpInside)
        
        let addToAppButton = UIButton()
        addToAppButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addToAppButton)
        addToAppButton.setBackgroundImage(UIImage(systemName: "plus.square.fill"), for: .normal)
        addToAppButton.tintColor = .label
        addToAppButton.addTarget(self, action: #selector(addImageToApp), for: .touchUpInside)
        
        setupCollectionView()
        
        NSLayoutConstraint.activate([
            addToAppButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            addToAppButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addToAppButton.heightAnchor.constraint(equalToConstant: 45),
            addToAppButton.widthAnchor.constraint(equalTo: addToAppButton.heightAnchor),
            
            shareButton.topAnchor.constraint(equalTo: addToAppButton.topAnchor),
            shareButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            shareButton.heightAnchor.constraint(equalTo: addToAppButton.heightAnchor),
            shareButton.widthAnchor.constraint(equalTo: addToAppButton.widthAnchor),
            
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
        let images = [UIImage(systemName: "heart")!, UIImage(systemName: "star.fill")!, UIImage(systemName: "bolt.fill")!,UIImage(systemName: "heart.fill")!, UIImage(systemName: "star.fill")!, UIImage(systemName: "bolt.fill")!, UIImage(systemName: "heart")!, UIImage(systemName: "star.fill")!, UIImage(systemName: "bolt.fill")!,UIImage(systemName: "heart.fill")!, UIImage(systemName: "star.fill")!, UIImage(systemName: "bolt.fill")!]
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
        guard photo != nil else { fatalError("photo is nil")}
        let items = [photo]
        let ac = UIActivityViewController(activityItems: items as [Any], applicationActivities: nil)
        present(ac, animated: true)
    }
    
    @objc
    private func addImageToApp() {
        print("add img to app")
    }
    
}
