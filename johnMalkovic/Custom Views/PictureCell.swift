//
//  PictureCell.swift
//  johnMalkovic
//
//  Created by Marina Beatriz Santana de Aguiar on 26.10.20.
//

import UIKit

class PictureCell: UICollectionViewCell {

    static let reuseID = "Cell"
    let imageView = UIImageView()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func configure(withImage image: UIImage) {
        imageView.image = image.withTintColor(.label)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .label
        addSubview(imageView)
                
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            // Images must have a height/width anchor
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
        ])
    }
}
