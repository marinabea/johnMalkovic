//
//  TabVC.swift
//  johnMalkovic
//
//  Created by Marina Beatriz Santana de Aguiar on 27.10.20.
//

import UIKit

class TabVC: UITabBarController {
    var selfie: UIImage!
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, selfie: UIImage) {
        self.selfie = selfie
        super.init(nibName: nil, bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        //Mark: Edge case here, maybe show standard picture?
        guard selfie != nil else { fatalError("User did not take photo")}
        
        let cameraVC = CameraVC()
        cameraVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "camera"), tag: 0)
        
        let homeVC = HomeVC()
        homeVC.photo = selfie
        homeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), tag: 1)
        
        let photoAlbumVC = PhotoAlbumVC()
        photoAlbumVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person.2.square.stack"), tag: 2)
        
        setViewControllers([cameraVC, homeVC, photoAlbumVC], animated: false)
        selectedIndex = 1
        tabBar.tintColor = .label
    }
}
