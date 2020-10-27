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
        let tapText = UILabel()
        tapText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tapText)
        tapText.text = "Tap to take a selfie"
        tapText.font = UIFont.preferredFont(forTextStyle: .title3)
        tapText.tintColor = .label
        
        let openCameraButton = UIButton()
        openCameraButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(openCameraButton)
        openCameraButton.setBackgroundImage(UIImage(systemName: "camera.circle.fill"), for: .normal)
        openCameraButton.tintColor = .label
        openCameraButton.addTarget(self, action: #selector(configurePicker), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            openCameraButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openCameraButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            openCameraButton.heightAnchor.constraint(equalToConstant: 150),
            openCameraButton.widthAnchor.constraint(equalTo: openCameraButton.heightAnchor),
            
            tapText.topAnchor.constraint(equalTo: openCameraButton.bottomAnchor, constant: 10),
            tapText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc
    private func configurePicker() {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        if UIImagePickerController.isSourceTypeAvailable(picker.sourceType) {
            present(picker, animated: true)
        } else {
            print("You must test this app on a real device in order to take a picture.")
        }
    }

}


//MARK: THIS IS NOT DRY -- fix it (see end of StarterVC)
extension CameraVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        let img = info[.editedImage] as! UIImage
        let vc = TabVC(nibName: nil, bundle: nil, selfie: img)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}



