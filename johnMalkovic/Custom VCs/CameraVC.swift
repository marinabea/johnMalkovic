//
//  CameraVC.swift
//  johnMalkovic
//
//  Created by Marina Beatriz Santana de Aguiar on 27.10.20.
//

import UIKit

class CameraVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: Open camera -- image picker
        configure()
    }
    
    private func configure() {
        self.imagePickerController(<#T##picker: UIImagePickerController##UIImagePickerController#>, didFinishPickingMediaWithInfo: <#T##[UIImagePickerController.InfoKey : Any]#>))
    }
}
