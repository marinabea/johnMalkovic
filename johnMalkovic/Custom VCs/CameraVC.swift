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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configure()
    }
    
    private func configure() {
        present(pickImage(from: .camera), animated: true)
    }
}

//MARK: THIS IS NOT DRY -- fix it (see end of StarterVC)
extension CameraVC {
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        let img = info[.editedImage] as! UIImage
        let vc = TabVC(nibName: nil, bundle: nil, selfie: img)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension CameraVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func pickImage(from source: UIImagePickerController.SourceType) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = source
        if UIImagePickerController.isSourceTypeAvailable(picker.sourceType) {
            picker.allowsEditing = true
            picker.delegate = self
        } else {
            print("You must test this app on a real device in order to take a picture.")
        }
        return picker
    }
}


