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
    @IBOutlet private weak var activityIndicator: BindableActivityIndicator!
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var profileInfoView: UIView!
    @IBOutlet private weak var passportInfoView: UIView!
    @IBOutlet private weak var radioButtonsContainer: RadioButtonsContainer!
    @IBOutlet private weak var catchPhotoButton: CommandableButton!
    @IBOutlet private weak var nextButton: CommandableButton!
    @IBOutlet weak var submitButton: CommandableButton!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cjNumberTextField: UITextField!
    @IBOutlet weak var passportOrIdTextField: UITextField!
    @IBOutlet private var indicatorView: [UIView]!
    @IBOutlet weak var leftIndicatorWidth: NSLayoutConstraint!
    @IBOutlet weak var righthIndIndicatorWidth: NSLayoutConstraint!
    
    private var viewModel: IRegisterViewModel!
    
    private var isOn = true {
        didSet{
            if isOn == true {
                UIView.animate(withDuration: 0.5) {
                    self.leftIndicatorWidth.constant = 10
                    self.righthIndIndicatorWidth.constant = 22
                    self.indicatorView[1].backgroundColor = UIColor(named: "Orange")
                    self.indicatorView[0].backgroundColor = UIColor(named: "light Orange")}
            } else {
                UIView.animate(withDuration: 0.5) {
                    self.leftIndicatorWidth.constant = 22
                    self.righthIndIndicatorWidth.constant = 10
                    self.indicatorView[1].backgroundColor = UIColor(named: "light Orange")
                    self.indicatorView[0].backgroundColor = UIColor(named: "Orange")
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindGestureRecognizers()
        self.setupViewModel()
    }
    
    private func setupViewModel() {
        self.viewModel = ServiceLocator.instance.resolve(IRegisterViewModel.self)
        
        self.viewModel.setupCommand.execute()
        
        self.viewModel.image.skip(first: 1).map({ UIImage(data: $0!) }).bind(to: self.profileImageView.reactive.image).dispose(in: self.bag)
        self.viewModel.fullName.bidirectionalBind(to: self.fullNameTextField.reactive.text).dispose(in: self.bag)
        self.viewModel.phoneNumber.bidirectionalBind(to: self.phoneNumberTextField.reactive.text).dispose(in: self.bag)
        self.viewModel.email.bidirectionalBind(to: self.emailTextField.reactive.text).dispose(in: self.bag)
        self.viewModel.isPassportInfoAllowable.bind(to: self.nextButton.reactive.isEnabled).dispose(in: self.bag)
        self.viewModel.cjNumber.bidirectionalBind(to: self.cjNumberTextField.reactive.text).dispose(in: self.bag)
        self.viewModel.isPassport.bidirectionalBind(to: self.radioButtonsContainer.isPassportActive).dispose(in: self.bag)
        self.viewModel.passportOrIdNumber.bidirectionalBind(to: self.passportOrIdTextField.reactive.text).dispose(in: self.bag)
        self.viewModel.getUsersCommand.isBusy.bind(to: self.activityIndicator.isOn).dispose(in: self.bag)
        
        self.catchPhotoButton.command = self.viewModel.catchPhotoCommand
        self.submitButton.command = self.viewModel.submitCommand
    }
    
    
    private func showPassportInfoView(_ show: Bool) {
        self.isOn = show
        self.passportInfoView.isHidden = !show
        self.profileInfoView.isHidden = show
        self.navigationItem.leftBarButtonItem = (show ? self.backBarButton : nil)
    }
    
    // MARK: - IBAction Methods -
    
    @IBAction private func backBarButtonTapped(_ sender: UIBarButtonItem) {
        self.showPassportInfoView(false)
    }
    
    @IBAction private func nextButtonTapped() {
        self.showPassportInfoView(true)
    }
}
