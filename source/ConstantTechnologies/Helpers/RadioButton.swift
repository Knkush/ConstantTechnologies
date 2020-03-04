//
//  RadioButton.swift
//  ConstantTechnologies
//
//  Created by Qnqush on 3/3/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import UIKit
import Bond

final class RadioButton: UIButton {
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var radioImageView: UIImageView!
    var isOn: Observable<Bool> = Observable<Bool>(true)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }
    
    @objc private func buttonTapped() {
        guard !self.isOn.value else { return }
        
        self.isOn.value = true
    }
    
    private func setup() {
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        self.isOn
            .distinctUntilChanged()
            .observeNext(with: { [weak self] in
            self?.radioImageView.image = ($0 ? #imageLiteral(resourceName: "imgRadioButtonOn") : #imageLiteral(resourceName: "imgRadioButtonOff"))
        }).dispose(in: self.bag)
    }
}
