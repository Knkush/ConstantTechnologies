//
//  PhotoCatchService.swift
//  ConstantTechnologies
//
//  Created by Khachatur Hakobyan on 3/4/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import ConstantTechnologiesCore
import Promises
import UIKit

class PhotoCatchService: NSObject, IPhotoCatchService {
    func isSourceTypeAvailable(isSourceTypeCamera: Bool) -> Bool {
        let sourceType: UIImagePickerController.SourceType = (isSourceTypeCamera ? .camera : .photoLibrary)
        
        return UIImagePickerController.isSourceTypeAvailable(sourceType)
    }
    
    let promise = Promise<Data?>(nil)
    
    func catchPhoto(fromCamera: Bool) -> Promise<Data?> {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = (fromCamera ? .camera : .photoLibrary)
        UIApplication.shared.keyWindow?.rootViewController?.present(imagePickerController, animated: true, completion: nil)
        
        return self.promise
    }
}


// MARK : -  UIImagePickerControllerDelegate, UINavigationControllerDelegate -

extension PhotoCatchService: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let catchedPhoto  = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        
        self.promise.fulfill(catchedPhoto.pngData())
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
