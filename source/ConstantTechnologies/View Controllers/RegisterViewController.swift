//
//  RegisterViewController.swift
//  ConstantTechnologies
//
//  Created by Qnqush on 3/3/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet private var fieldsLabel: [UILabel]!
    @IBOutlet private var fieldsImageView: [UIImageView]!
    
    private var isSelected = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Private Methods -
    
    private func radioButton(_ labelNumber: Int, _ imageViewNumber: Int) {
        self.isSelected = !self.isSelected
        
        if self.isSelected {
            self.fieldsImageView[imageViewNumber].image = #imageLiteral(resourceName: "imgRadioButtonOff")
        self.fieldsImageView[imageViewNumber].tintColor = UIColor.darkGray
            self.fieldsLabel[labelNumber].textColor = UIColor.darkGray
        } else {
            self.fieldsImageView[imageViewNumber].image = #imageLiteral(resourceName: "imgRadioButtonOn")
            self.fieldsImageView[imageViewNumber].tintColor = UIColor(named: "Orange")
            self.fieldsLabel[labelNumber].textColor = UIColor.black
        }
        
    }
    
    // MARK: - IBAction Methods -
    
    @IBAction func passportButtonTapped(_ sender: UIButton) {
        self.radioButton(0, 0)
    }
    
    
    
    @IBAction func chooseImageButtonTapped(_ sender: UIButton) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let alert =  UIAlertController(title: "Photo source", message: "Choose a sourse", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            } else {
                print("Camera is not available")
            }
        }))
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

// MARK : -  UIImagePickerControllerDelegate, UINavigationControllerDelegate -

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image  = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.profileImageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
