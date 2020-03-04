//
//  RegisterViewController.swift
//  ConstantTechnologies
//
//  Created by Qnqush on 3/3/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import UIKit
import ConstantTechnologiesViewModels
import ConstantTechnologiesCore

final class RegisterViewController: UIViewController {
    @IBOutlet private weak var backBarButton: UIBarButtonItem!
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var profileInfoView: UIView!
    @IBOutlet private weak var passportInfoView: UIView!
    @IBOutlet private weak var radioButtonsContainer: RadioButtonsContainer!
    @IBOutlet private weak var nextButton: CommandableButton!
    @IBOutlet weak var submitButton: CommandableButton!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cjNumberTextField: UITextField!
    @IBOutlet weak var passportOrIdTextField: UITextField!
    private var viewModel: IRegisterViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindGestureRecognizers()
        self.setupViewModel()
    }
    
    private func setupViewModel() {
        self.viewModel = ServiceLocator.instance.resolve(IRegisterViewModel.self)
        
        self.viewModel.setupCommand.execute()
        
        self.viewModel.fullName.bidirectionalBind(to: self.fullNameTextField.reactive.text).dispose(in: self.bag)
        self.viewModel.phoneNumber.bidirectionalBind(to: self.phoneNumberTextField.reactive.text).dispose(in: self.bag)
        self.viewModel.email.bidirectionalBind(to: self.emailTextField.reactive.text).dispose(in: self.bag)
        self.viewModel.isPassportInfoAllowable.bind(to: self.nextButton.reactive.isEnabled).dispose(in: self.bag)
        self.viewModel.cjNumber.bidirectionalBind(to: self.cjNumberTextField.reactive.text).dispose(in: self.bag)
        self.viewModel.isPassport.bidirectionalBind(to: self.radioButtonsContainer.isPassportActive).dispose(in: self.bag)
        self.viewModel.passportOrIdNumber.bidirectionalBind(to: self.passportOrIdTextField.reactive.text).dispose(in: self.bag)
        
        self.submitButton.command = self.viewModel.submitCommand
    }
    
    
    private func showPassportInfoView(_ show: Bool) {
        self.passportInfoView.isHidden = !show
        self.profileInfoView.isHidden = show
        self.navigationItem.leftBarButtonItem = (show ? self.backBarButton : nil)
    }
    
    // MARK: - IBAction Methods -
    
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
    
    @IBAction func backBarButtonTapped(_ sender: UIBarButtonItem) {
        self.showPassportInfoView(false)
    }
    
    @IBAction private func nextButtonTapped() {
        self.showPassportInfoView(true)
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
