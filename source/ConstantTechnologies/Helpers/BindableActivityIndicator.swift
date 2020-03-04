//
//  BindableActivityIndicator.swift
//  ConstantTechnologies
//
//  Created by Qnqush on 3/4/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import UIKit
import Bond

class BindableActivityIndicator: UIActivityIndicatorView {
    var isOn: Observable<Bool> = Observable<Bool>(true)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }
    
    private func setup() {
        self.isOn
            .observeNext(with: { [weak self] in
                self?.isHidden = !$0
                
                $0
                    ? self?.startAnimating()
                    : self?.stopAnimating()
            }).dispose(in: self.bag)
    }
}
