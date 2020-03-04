//
//  PhotoCatchService.swift
//  ConstantTechnologies
//
//  Created by Qnqush on 3/4/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import ConstantTechnologiesCore
import Promises
import UIKit

class PhotoCatchService: NSObject, IPhotoCatchService {
    private var catchPhotoTask: Promise<Data?>!
    
    func isSourceTypeAvailable(isSourceTypeCamera: Bool) -> Bool {
        let sourceType: UIImagePickerController.SourceType = (isSourceTypeCamera ? .camera : .photoLibrary)
        
        return UIImagePickerController.isSourceTypeAvailable(sourceType)
    }
    
    
    
    func catchPhoto(fromCamera: Bool) -> Promise<Data?> {
        self.catchPhotoTask = Promise<Data?>.pending()
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = (fromCamera ? .camera : .photoLibrary)
        UIApplication.shared.keyWindow?.rootViewController?.present(imagePickerController, animated: true, completion: nil)
        
        return self.catchPhotoTask
    }
}


// MARK : -  UIImagePickerControllerDelegate, UINavigationControllerDelegate -

extension PhotoCatchService: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let catchedPhoto  = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        
        self.catchPhotoTask.fulfill(catchedPhoto.pngData())
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
