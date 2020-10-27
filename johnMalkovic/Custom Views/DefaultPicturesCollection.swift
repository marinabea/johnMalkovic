//
//  DefaultPicturesCollection.swift
//  johnMalkovic
//
//  Created by Marina Beatriz Santana de Aguiar on 26.10.20.
//

import UIKit

class DefaultPicturesCollections: UICollectionView {
    var images: [UIImage]!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout, images: [UIImage]) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.images = images
        dataSource = self
    }
    
}

extension DefaultPicturesCollections: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PictureCell.reuseID, for: indexPath) as? PictureCell else {
            fatalError("Unable to dequeue Cell")
        }
        cell.configure(withImage: images[indexPath.row])
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}

