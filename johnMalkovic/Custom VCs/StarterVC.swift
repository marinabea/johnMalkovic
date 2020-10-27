//
//  StarterVC.swift
//  johnMalkovic
//
//  Created by Marina Beatriz Santana de Aguiar on 26.10.20.
//

import UIKit
import AVKit
import Photos

class StarterVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        
        let declineButton = UIButton()
        declineButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(declineButton)
        declineButton.setTitle("Decline", for: .normal)
        declineButton.backgroundColor = UIColor.systemRed
        declineButton.layer.borderColor = UIColor.systemRed.cgColor
        declineButton.layer.cornerRadius = 2
        declineButton.setTitleColor(UIColor.black, for: .highlighted)
        declineButton.addTarget(self, action: #selector(declineSelfiePermission), for: .touchUpInside)
        
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textLabel)
        textLabel.text = "First,\n you gotta take a selfie"
        textLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        textLabel.font = UIFont.boldSystemFont(ofSize: 40)
        textLabel.numberOfLines = 0
        textLabel.textAlignment = .center
        
        let checkImgView = UIImageView(image: UIImage(systemName: "checkmark"))
        checkImgView.tintColor = .green
        checkImgView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(checkImgView)
        
        let xMarkView = UIImageView(image: UIImage(systemName: "xmark"))
        xMarkView.tintColor = .systemRed
        xMarkView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(xMarkView)
        
        let recommendedImg = UILabel()
        recommendedImg.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(recommendedImg)
        recommendedImg.text = "🙂"
        recommendedImg.font = .boldSystemFont(ofSize: 100)
        
        let nonRecommendedImg1 = UILabel()
        nonRecommendedImg1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nonRecommendedImg1)
        nonRecommendedImg1.text = "😎"
        nonRecommendedImg1.font = .boldSystemFont(ofSize: 75)
        
        let nonRecommendedImg2 = UILabel()
        nonRecommendedImg2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nonRecommendedImg2)
        nonRecommendedImg2.text = "😆"
        nonRecommendedImg2.font = .boldSystemFont(ofSize: 75)
        
        let nonRecommendedImg3 = UILabel()
        nonRecommendedImg3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nonRecommendedImg3)
        nonRecommendedImg3.text = "😏"
        nonRecommendedImg3.font = .boldSystemFont(ofSize: 75)
        
        let photoRecommendationStack = UIStackView(arrangedSubviews: [nonRecommendedImg1, nonRecommendedImg2, nonRecommendedImg3])
        photoRecommendationStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(photoRecommendationStack)
        photoRecommendationStack.axis = .horizontal
        photoRecommendationStack.distribution = .equalSpacing
        photoRecommendationStack.layer.borderColor = UIColor.systemRed.cgColor
        photoRecommendationStack.layer.borderWidth = 2
        photoRecommendationStack.layer.cornerRadius = 20
        
        let takeSelfieButton = UIButton()
        takeSelfieButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(takeSelfieButton)
        takeSelfieButton.setTitle("Take a Selfie", for: .normal)
        takeSelfieButton.backgroundColor = UIColor.systemBlue
        takeSelfieButton.layer.borderColor = UIColor.systemBlue.cgColor
        takeSelfieButton.layer.cornerRadius = 3
        takeSelfieButton.setTitleColor(UIColor.black, for: .highlighted)
        takeSelfieButton.addTarget(self, action: #selector(takeSelfie), for: .touchUpInside)
        
        let uploadButton = UIButton()
        uploadButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(uploadButton)
        uploadButton.setTitle("Upload from Album", for: .normal)
        uploadButton.backgroundColor = UIColor.brown
        uploadButton.layer.borderColor = UIColor.brown.cgColor
        uploadButton.layer.cornerRadius = 3
        uploadButton.setTitleColor(UIColor.black, for: .highlighted)
        uploadButton.addTarget(self, action: #selector(uploadPicture), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            declineButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            declineButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            declineButton.widthAnchor.constraint(equalToConstant: 75),
            declineButton.heightAnchor.constraint(equalTo: uploadButton.heightAnchor),
            
            recommendedImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recommendedImg.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            textLabel.bottomAnchor.constraint(equalTo: recommendedImg.topAnchor, constant: -10),
            
            photoRecommendationStack.topAnchor.constraint(equalTo: recommendedImg.bottomAnchor, constant: 10),
            photoRecommendationStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    
            uploadButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            uploadButton.leadingAnchor.constraint(equalTo: takeSelfieButton.leadingAnchor),
            uploadButton.trailingAnchor.constraint(equalTo: takeSelfieButton.trailingAnchor),
            uploadButton.heightAnchor.constraint(equalTo: takeSelfieButton.heightAnchor),
            
            takeSelfieButton.bottomAnchor.constraint(equalTo: uploadButton.topAnchor, constant: -20),
            takeSelfieButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            takeSelfieButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            takeSelfieButton.heightAnchor.constraint(equalToConstant: 45),
            
            checkImgView.bottomAnchor.constraint(equalTo: recommendedImg.topAnchor, constant: 20),
            checkImgView.trailingAnchor.constraint(equalTo: recommendedImg.trailingAnchor),
            checkImgView.heightAnchor.constraint(equalToConstant: 30),
            checkImgView.widthAnchor.constraint(equalToConstant: 30),
        
            xMarkView.bottomAnchor.constraint(equalTo: photoRecommendationStack.topAnchor),
            xMarkView.trailingAnchor.constraint(equalTo: photoRecommendationStack.trailingAnchor),
            xMarkView.heightAnchor.constraint(equalToConstant: 30),
            xMarkView.widthAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    @objc
    private func declineSelfiePermission() {
        let alert = UIAlertController(title: "Decline to take selfie", message: "We can't reface without a picture of your face.", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Take a Selfie", style: .default) {
            [weak self] action in
            self?.takeSelfie()
        })
        alert.addAction(UIAlertAction(title: "Decline", style: .cancel))
        present(alert, animated: true)
    }
    
    @objc
    private func takeSelfie() { showCamera() }
    
    @objc
    private func uploadPicture() {
        openGallery()
    }
    
    private func showCamera() {
        present(pickImage(from: .camera), animated: true)
    }
    
    private func openGallery() {
        present(pickImage(from: .photoLibrary), animated: true)
    }
}

//MARK: THIS IS NOT DRY -- fix it (see end of CameraVC)
extension StarterVC {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        // PROBLEM SOLVED: declared attributes must be set before call of super.init inside constructor
        let img = info[.editedImage] as! UIImage
        let vc = TabVC(nibName: nil, bundle: nil, selfie: img)
        self.navigationController?.pushViewController(vc, animated: false)
    }
}

extension StarterVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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

//UIImageWriteToSavedPhotosAlbum



